variable "vpc_cidr_block" {
  default = "10.20.0.0/16"
}

variable "subnet_cidr_public_a" {
  default = "10.20.1.0/24"
}

variable "subnet_cidr_public_b" {
  default = "10.20.2.0/24"
}

variable "subnet_cidr_public_vpc" {
  default = "10.20.3.0/24"
}

variable "subnet_cidr_priv_a" {
  default = "10.20.4.0/24"
}

variable "subnet_cidr_priv_b" {
  default = "10.20.5.0/24"
}

variable "subnet_cidr_priv_docker" {
  default = "10.20.6.0/24"
}


variable "az_a" {
  default = "us-east-1a"
}

variable "az_b" {
  default = "us-east-1b"
}

variable "az_b2" {
  default = "us-east-1b"
}

variable "meu_ip" {
  default = "seu-ip"
}

variable "ami_linux" {
  default = "ami-005fc0f236362e99f"
}

variable "tipo_instancia" {
  default = "t2.micro"
}

variable "chave_name" {
  default = "chave_prova"
}

variable "nome_db" {
  default = "wordpress"
}

variable "senha_db" {
  default = "elfos123"
}

variable "user_db" {
  default = "elfos"
}
