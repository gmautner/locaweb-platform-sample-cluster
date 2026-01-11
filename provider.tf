# CloudStack provider reads credentials from environment variables:
#   CLOUDSTACK_API_URL
#   CLOUDSTACK_API_KEY
#   CLOUDSTACK_SECRET_KEY
provider "cloudstack" {}

provider "helm" {
  kubernetes = {
    config_path = module.cluster.kubeconfig_path
  }
}
