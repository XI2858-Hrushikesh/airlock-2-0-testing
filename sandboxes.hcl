# The VM the task scripts run on.

resource "vm" "testvm" {
  image {
    name = "ubuntu:22.04"
  }

  resources {
    cpu    = 2
    memory = 2048
  }
}
