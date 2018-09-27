output "public_dns" {
  value = ["${aws_instance.workshop.*.public_dns}"]
}
