# The VM the task scripts run on (volume removed again - it stops the VM booting, see point 2).

resource "vm" "testvm" {
  image {
    name = "ubuntu:22.04"
  }

  resources {
    cpu    = 2
    memory = 2048
  }
}
