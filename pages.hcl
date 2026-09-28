resource "page" "p1_solve_timeout" {
  title = "1 - Solve cut off at ~30s"
  file  = "instructions/repro/p1_solve_timeout.md"

  activities = {
    solve_control    = resource.task.solve_control
    solve_long       = resource.task.solve_long
    solve_multi      = resource.task.solve_multi
    solve_background = resource.task.solve_background
  }
}
