resource "terminal" "vm_shell" {
  target = resource.vm.testvm
  shell  = "/bin/bash"
}
