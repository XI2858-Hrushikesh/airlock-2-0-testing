# Support repro lab - Airlock finding 1: solve cut off at ~30s.

resource "lab" "main" {
  title       = "2.0 Repro - Solve timeout (point 1)"
  description = "Checks whether solve scripts are cut off at ~30s even with a 180s timeout."
  layout      = resource.layout.two_column

  settings {
    timelimit {
      duration = "1h"
    }
  }

  content {
    chapter "repro" {
      title = "Point 1 - Solve timeout"

      page "p1_solve_timeout" {
        reference = resource.page.p1_solve_timeout
      }
    }
  }
}
