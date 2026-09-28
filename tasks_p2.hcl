# Point 2: is the VM volume mounted at its destination automatically?
resource "task" "volume" {
  description = "2 - Volume ./files is mounted at /opt/files"

  config {
    target = resource.vm.testvm
  }

  condition "mounted" {
    description = "/opt/files/hello.txt is readable"

    check {
      script          = "scripts/task/volume/check.sh"
      failure_message = "Volume is not mounted at /opt/files"
    }
  }
}
