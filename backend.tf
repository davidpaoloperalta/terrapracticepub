terraform {
  backend "s3" {
    bucket = "terrapractice-statefiles"
    region = "ap-southeast-1"
    key    = "state/"
  }
}