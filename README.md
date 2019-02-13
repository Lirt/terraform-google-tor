# Terraform Tor Module

Terraform module to spawn tor instances in GCP.

## Usage

* Export environment variable `GOOGLE_CLOUD_KEYFILE_JSON` with path to your google cloud keyfile.
    * Example: `export GOOGLE_CLOUD_KEYFILE_JSON=/home/user123/.gcp_credentials/user123-tor.json`.
* To fill variables, there are 2 options:
    1. Create variables file `terraform.tfvars` and override variables listed in `variables.tf`
    1. Export variables as environment variables prefixed with `TF_VAR` (eg. `TF_VAR_gcp_project_id="user123-tor"`).

Run:

```bash
terraform init
terraform plan
terraform apply
```

Or use it as module (Variables `gcp_*` can be omitted when exported as mentioned above):

```terraform
module "my-tor-cluster" {
  source         = "lirt/tor/google"
  version        = "0.1.0"

  gcp_project_id = "my-tor-project"
  gcp_region     = "europe-west1"
  gcp_zone       = "europe-west1-b"
  tor_node_count = "2"
}
```

More available variables are listed in file `variables.tf`.
