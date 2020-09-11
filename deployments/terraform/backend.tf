terraform {
  backend "gcs" {
    bucket  = "beksul-fuchicorp-bucket"
    prefix  = "dev/common_tools"
    project = "atomic-segment-288118"
  }
}
