# AWS Landing Zone with Terraform
An opinionated template set for configuring a multi-environment AWS architecture with Terraform

### Enabling Remote State Management
terraform remote config \
    -backend=s3 \
    -backend-config="bucket=tf-landingzone" \
    -backend-config="key=terraform.tfstate" \
    -backend-config="region=us-west-2" \
    -backend-config="encrypt=true"

