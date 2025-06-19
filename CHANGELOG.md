# Changelog

## v1.5.0
* Change the default value of the `admin_password` module input variable to `RubrikGoForward`.
* Support specifying additional managed policies for the Cloud Cluster ES IAM role using the
  `aws_cloud_cluster_iam_managed_policies` module input variable.
* Support specifying an IAM role permission boundary for the Cloud Cluster ES IAM role using the
  `aws_cloud_cluster_iam_permission_boundary` module input variable.
* Deprecate the `enableImmutability` module input variable. Use the `enable_immutability` variable instead.
* Update the [polaris](https://registry.terraform.io/providers/rubrikinc/polaris/latest) Terraform provider to version
  1.1.x.

## v1.4.1
* Remove redundant empty provider statement
* Reduce non-data disk throughput when using split disks to 125.
