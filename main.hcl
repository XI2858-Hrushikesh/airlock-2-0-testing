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

      page "p5_logs" {
        reference = resource.page.p5_logs
      }
      page "p3_disk" {
        reference = resource.page.p3_disk
      }
      page "p1_solve_timeout" {
        reference = resource.page.p1_solve_timeout
      }
    }
  }
}
