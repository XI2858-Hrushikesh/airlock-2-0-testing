resource "page" "p5_logs" {
  title = "5 - Script output in logs"
  file  = "instructions/repro/p5_logs.md"

  activities = {
    logs = resource.task.logs
  }
}
