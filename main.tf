provider "scaleway" {
  zone   = "fr-par-1"
  region = "fr-par"
}

# Get IP-Adress
resource "scaleway_instance_ip" "public_ip" {}

# Create Server
resource "scaleway_instance_server" "web" {
  name  = "auto-ssh-server"
  type  = "DEV1-S"
  image = "ubuntu-focal"
  ip_id = scaleway_instance_ip.public_ip.id
}

# Print IP from Server
output "public_ip" {
  value = scaleway_instance_ip.public_ip.id
}
