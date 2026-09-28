# Point 3: does the ubuntu:22.04 root filesystem use the whole disk?
resource "task" "disk" {
  description = "3 - Root filesystem uses the whole disk"

  config {
    target = resource.vm.testvm
  }

  condition "rootfs_size" {
    description = "Root filesystem is larger than 5 GB"

    check {
      script          = "scripts/task/disk/check.sh"
      failure_message = "Root filesystem is smaller than 5 GB - disk not expanded"
    }
  }
}
