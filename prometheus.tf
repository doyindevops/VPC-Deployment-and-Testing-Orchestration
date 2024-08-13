resource "docker_image" "prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_container" "prometheus" {
  image = docker_image.prometheus.image_id
  name  = "prometheus_container"

  ports {
    internal = 9090
    external = 9090
  }

  volumes {
    host_path      = "/home/doyin/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }
}
