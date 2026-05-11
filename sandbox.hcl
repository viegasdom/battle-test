resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "container" "ubuntu" {
  image {
    name = "ubuntu"
  }

  command = ["tail", "-f", "/dev/null"]

  network {
    id = resource.network.main.meta.id
  }
}

resource "exec" "setup_env" {
  target = resource.container.ubuntu
  script = file("scripts/setup/init.sh")
}
