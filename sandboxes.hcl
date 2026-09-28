# Point 6: boot the stock AlmaLinux 9 GenericCloud image imported via Image Builder.
# No health_check, same as the customer's gateway-vm.

resource "vm" "testvm" {
  image {
    name = "instruqt-support/almalinux-9-test:v1"
  }

  resources {
    cpu    = 2
    memory = 2048
  }
}
