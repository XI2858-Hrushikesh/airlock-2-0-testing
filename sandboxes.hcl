# Point 2 retest: customer's exact volume setup (dir(), read_only, network).
# No startup_script, so nothing mounts the share for us.

resource "network" "main" {
  subnet = "10.0.200.0/24"
}

resource "vm" "testvm" {
  image {
    name = "ubuntu:22.04"
  }

  resources {
    cpu    = 2
    memory = 2048
  }

  network {
    id = resource.network.main.meta.id
  }

  volume {
    source      = dir()
    destination = "/opt/iam-lab"
    read_only   = true
  }
}
