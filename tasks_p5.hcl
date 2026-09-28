# Point 5: does check/solve script output show up in the logs?
resource "task" "logs" {
  description = "5 - Is check/solve output visible in the logs?"

  config {
    target = resource.vm.testvm
  }

  condition "markers" {
    description = "Solve has been run"

    check {
      script          = "scripts/task/logs/check.sh"
      failure_message = "Expected failure - now search the logs for REPRO-CHECK"
    }

    solve {
      script = "scripts/task/logs/solve.sh"
    }
  }
}
