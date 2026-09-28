resource "page" "p3_disk" {
  title = "3 - ubuntu:22.04 disk size"
  file  = "instructions/repro/p3_disk.md"

  activities = {
    disk = resource.task.disk
  }
}
