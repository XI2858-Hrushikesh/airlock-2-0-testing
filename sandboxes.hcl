# The VM the task scripts run on.
# Point 2: volume ./files -> /opt/files. No startup_script, so nothing mounts it for us.

resource "vm" "testvm" {
  image {
    name = "ubuntu:22.04"
  }

  resources {
    cpu    = 2
    memory = 2048
  }

  volume {
    source      = "./files"
    destination = "/opt/files"
  }
}
