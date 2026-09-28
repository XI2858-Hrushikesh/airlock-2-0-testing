# All tasks run on the test VM. Every timeout is raised to 180s at task,
# condition and script level, so any failure at ~30s is NOT the HCL timeout.

# ---------- Point 1: solve timeout ----------

# 1a. Control: one solve script of ~20s. Expected: works.
resource "task" "solve_control" {
  description = "1a - Control: solve that takes ~20s"

  config {
    target  = resource.vm.testvm
    timeout = "180s"
  }

  condition "done" {
    description = "Marker /tmp/solve_control.done exists"

    config {
      timeout = "180s"
    }

    check {
      script          = "scripts/task/solve_single/check_control.sh"
      failure_message = "Not solved yet - click Solve"
    }

    solve {
      script = "scripts/task/solve_single/solve_control.sh"
      config {
        timeout = "180s"
      }
    }
  }
}

# 1b. One solve script of ~45s. Expected (bug): fails at ~30s with 504 /
#     "Failed to fetch", although the marker appears on the VM later.
resource "task" "solve_long" {
  description = "1b - One solve script that takes ~45s"

  config {
    target  = resource.vm.testvm
    timeout = "180s"
  }

  condition "done" {
    description = "Marker /tmp/solve_long.done exists"

    config {
      timeout = "180s"
    }

    check {
      script          = "scripts/task/solve_single/check_long.sh"
      failure_message = "Not solved yet - click Solve"
    }

    solve {
      script = "scripts/task/solve_single/solve_long.sh"
      config {
        timeout = "180s"
      }
    }
  }
}

# 1c. The customer's exact shape: several solve scripts, each under 30s,
#     but ~40s together. Expected (bug): the request fails and the second
#     marker is never written.
resource "task" "solve_multi" {
  description = "1c - Two solve scripts of ~20s each (~40s total)"

  config {
    target  = resource.vm.testvm
    timeout = "180s"
  }

  condition "done" {
    description = "Both markers exist"

    config {
      timeout = "180s"
    }

    check {
      script          = "scripts/task/solve_multi/check.sh"
      failure_message = "Not both markers present"
    }

    solve {
      script = "scripts/task/solve_multi/solve_part1.sh"
      config {
        timeout = "180s"
      }
    }

    solve {
      script = "scripts/task/solve_multi/solve_part2.sh"
      config {
        timeout = "180s"
      }
    }
  }
}

# 1d. The workaround we want to recommend: the solve starts a 90s job in
#     the background and returns at once; the check passes when it's done.
#     Verify the background job SURVIVES after the solve script exits.
resource "task" "solve_background" {
  description = "1d - Workaround: long job started in the background"

  config {
    target  = resource.vm.testvm
    timeout = "180s"
  }

  condition "done" {
    description = "Background job wrote /tmp/solve_bg.done"

    check {
      script          = "scripts/task/solve_background/check.sh"
      failure_message = "Background job not finished (or it was killed) - see /tmp/solve_bg.log"
    }

    solve {
      script = "scripts/task/solve_background/solve.sh"
    }
  }
}
