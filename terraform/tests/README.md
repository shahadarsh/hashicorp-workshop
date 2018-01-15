# tests for terraform
Run Unit/Integration tests

### Steps

- `terraform validate` 

- `tflint nginx.tf`
    - using https://github.com/wata727/tflint
    - TFLint is a Terraform linter for detecting errors that can not be detected by `terraform plan`
    - Using Docker : `docker run --rm -v $(pwd):/data --workdir=/data -t wata727/tflint`

- `terraform plan`

- `terraform apply`
    - Bring up ephemeral env for integration testing 

- `rake spec`
    - using https://github.com/k1LoW/awspec 
    - Runs awspec tests 

- `terraform destroy`
