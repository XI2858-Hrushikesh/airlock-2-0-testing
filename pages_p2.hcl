resource "page" "p2_volume" {
  title = "2 - VM volume mount"
  file  = "instructions/repro/p2_volume.md"

  activities = {
    volume = resource.task.volume
  }
}
