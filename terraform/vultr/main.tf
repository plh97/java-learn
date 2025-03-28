resource "vultr_instance" "instance" {
  plan              = "vc2-1c-2gb"
  region            = "sgp"
  snapshot_id       = "d7bf61a8-856e-4fdc-bb3b-34c4f6ad5cf1"
  firewall_group_id = "acbe8a72-6ad8-413e-ad71-a49db226cd11"
  hostname          = "vultr.guest"
  label             = "java instance"
  ssh_key_ids       = [vultr_ssh_key.my_ssh_key.id]
  provisioner "local-exec" {
    command = "sh modify_ip.sh ${self.public_ip}"
  }
}
