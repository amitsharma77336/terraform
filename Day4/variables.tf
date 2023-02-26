
variable "prefix" {
  default = "HR"
}

variable "env" {
  default = "test"
  type    = string

}

variable "location" {
  description = "This is the location of resource deployment"
  default     = "westeurope"
  type        = string
}
variable "osname"{

    description = "This is the name of the os"
    default = "myosname"
}
