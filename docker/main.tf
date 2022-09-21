terraform {
  required_providers {
    docker = {
      # https://registry.terraform.io/providers/kreuzwerker/docker/2.22.0/docs
      source  = "kreuzwerker/docker"
      version = "~> 2.22.0"
    }
  }
}

provider "docker" {
  # Linux, macOS
  host = "unix:///var/run/docker.sock"

  # Windows 11
  # host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:1.23"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
