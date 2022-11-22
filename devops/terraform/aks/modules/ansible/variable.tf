variable "aws_region" {
    default = "us-east-2c"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "instance_name" {
    default = "ansible-controler"
}
variable "ami_id" {
    default = "ami-097a2df4ac947655f"
}
variable "ssh_user_name" {
    default = "ubuntu"
}
variable "ssh_key_name" {
    default = "ansible-controler"
}
variable "ssh_key_path" {
    default = "/home/fabs/proj/ansible/ansible-controler.pem"
}
variable "instance_count" {
    default = 1
}
variable "subnet_id" {
    default = "subnet-05358372a06b722c9"
}
variable "dev_host_label" {
    default = "ansible_control_host"
}