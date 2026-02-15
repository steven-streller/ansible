terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

############################
# Variable
############################

variable "web_port" {
  description = "Port for web service on host"
  type        = number
  default     = 8080
}

############################
# Network
############################

resource "docker_network" "internal" {
  name = "internal_net"
}

############################
# Volume
############################

resource "docker_volume" "webdata" {
  name = "web_data"
}

############################
# Image
############################

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

############################
# Container
############################

resource "docker_container" "web" {
  name  = "web"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = var.web_port
  }

  volumes {
    volume_name    = docker_volume.webdata.name
    container_path = "/usr/share/nginx/html"
  }

  networks_advanced {
    name = docker_network.internal.name
  }

  depends_on = [
    docker_network.internal,
    docker_volume.webdata
  ]
}

############################
# Output
############################

output "web_url" {
  description = "URL of the web service"
  value       = "http://localhost:${var.web_port}"
}
