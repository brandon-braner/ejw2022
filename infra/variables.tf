variable "project" {
  default = "blb-ejw"
  description = "GCP Project name"
  type        = string
}

variable "region" {
  default = "us-east1"
  description = "GCP Region"
  type        = string
}

variable "zone" {
  default = "us-east1-b"
  description = "GCP Zone"
  type        = string
}

variable "creds-file" {
  default = "/Users/brandonbraner/Desktop/blb-ejw.json"
  description = "Creds file"
  type        = string
}