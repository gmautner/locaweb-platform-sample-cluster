# Locaweb Platform Sample Cluster

This repository demonstrates how to use the `cloudstack-k3s` module from [locaweb-platform](https://github.com/gmautner/locaweb-platform) to provision a Kubernetes cluster on CloudStack.

## Prerequisites

- Terraform or OpenTofu `~> 1.6.0`
- CloudStack account with API access
- DNS zone under your control for the `base_domain`

## Getting Started

1. Copy `terraform.tfvars.example` to `terraform.tfvars` and customize the values.

2. Set environment variables for CloudStack provider authentication:

   ```bash
   export CLOUDSTACK_API_URL="https://painel-cloud.locaweb.com.br/client/api"
   export CLOUDSTACK_API_KEY="your-api-key"
   export CLOUDSTACK_SECRET_KEY="your-secret-key"
   ```

3. Initialize and apply:

   ```bash
   terraform init
   terraform plan \
     -var="cloudstack_ccm_api_key=your-ccm-api-key" \
     -var="cloudstack_ccm_secret_key=your-ccm-secret-key"
   terraform apply \
     -var="cloudstack_ccm_api_key=your-ccm-api-key" \
     -var="cloudstack_ccm_secret_key=your-ccm-secret-key"
   ```

## Credential Management

### Provider Credentials (Environment Variables)

The CloudStack provider reads credentials from standard environment variables:

| Environment Variable     | Purpose                    |
| ------------------------ | -------------------------- |
| `CLOUDSTACK_API_URL`     | CloudStack API endpoint    |
| `CLOUDSTACK_API_KEY`     | CloudStack provider auth   |
| `CLOUDSTACK_SECRET_KEY`  | CloudStack provider auth   |

### CCM Credentials (Command-Line Variables)

CloudStack Cloud Controller Manager (CCM) credentials are passed via `-var` parameters:

| Variable                    | Purpose                       |
| --------------------------- | ----------------------------- |
| `cloudstack_ccm_api_key`    | CloudStack API key for CCM    |
| `cloudstack_ccm_secret_key` | CloudStack secret key for CCM |

These may use the same values as the provider credentials, or dedicated service account credentials with restricted permissions for the CCM.
