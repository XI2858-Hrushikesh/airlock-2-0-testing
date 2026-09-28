# Support repro lab - Airlock finding 1: solve cut off at ~30s.

resource "lab" "main" {
  title       = "2.0 Repro - Airlock findings"
  description = "Repro of the Airlock 2.0 findings, one page per point."
  layout      = resource.layout.two_column

  settings {
    timelimit {
      duration = "1h"
    }
  }

  content {
    chapter "repro" {
      title = "Airlock findings"

      page "p2_volume" {
        reference = resource.page.p2_volume
      }
      page "p1_solve_timeout" {
        reference = resource.page.p1_solve_timeout
      }
    }
  }
}
