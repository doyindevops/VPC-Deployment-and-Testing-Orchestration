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
    host_path      = "/mnt/c/Users/HP/Desktop/DEVSECOP PRACTICE/VPC-Deployment-and-Testing-Orchestration/prometheus.yml"
    container_path = "/etc/prometheus/prometheus.yml"
  }
}
