resource "terminal" "shell" {
  target = resource.container.ubuntu
}
