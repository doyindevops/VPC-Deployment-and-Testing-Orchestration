resource "docker_image" "redis" {
  name = "redis:latest"
}

resource "docker_image" "mariadb" {
  name = "mariadb:latest"
}

resource "docker_container" "redis" {
  image = docker_image.redis.image_id
  name  = "redis_container"
  ports {
    internal = 6379
    external = 6379
  }
}

resource "docker_container" "mariadb" {
  image = docker_image.mariadb.image_id
  name  = "mariadb_container"
  env = [
    "MYSQL_ROOT_PASSWORD=${var.mariadb_password}",
    "MYSQL_DATABASE=devop-database",
    "MYSQL_USER=devops",
    "MYSQL_PASSWORD=safe-password"
  ]
  ports {
    internal = 3306
    external = 3306
  }
}
