resource "layout" "two_column" {
  column {
    width = "45"
    instructions {}
  }

  column {
    width = "55"

    tab "terminal" {
      title  = "Terminal (testvm)"
      target = resource.terminal.vm_shell
    }
  }
}
