# Traefik Deployment on Kubernetes Example

This example illustrates how to use the `terraform-kubernetes-traefik` module to install Traefik on Kubernetes via the Terraform Helm Provider.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| namespace | Namespace to install traefik chart into (created if non-existent on target cluster) | string | `traefik` | no |
| traefik_chart_version | Version of Traefik chart to install | string | `10.19.4` | no |
| timeout_seconds | Helm chart deployment can sometimes take longer than the default 5 minutes. Set a custom timeout (secs) | number | `800` | no |
| replica_count | Number of replica pods to create | number | `1` | no |
| values_file | Name of the traefik helm chart values file to use | string | `values.yaml` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

To provision this example run the following commands from within this directory:
- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure
