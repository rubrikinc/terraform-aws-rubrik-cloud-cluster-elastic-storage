data "aws_ami" "cces_ami" {
  count = var.split_disk == null ? 1 : 0

  filter {
    name   = "image-id"
    values = [local.ami_id]
  }
}

locals {
  # Regular expression parsing the version number from the CCES AMI name.
  version_regex = "^rubrik-mp-cc-(\\d+)-(\\d+)-(\\d+).+$"

  # Extract the major, minor and maintenance version numbers from the CCES AMI
  # name. Only performed when the split_disk variable is not set.
  major_minor_maint = var.split_disk == null ? regex(local.version_regex, data.aws_ami.cces_ami[0].name) : null
  major_version     = local.major_minor_maint != null ? parseint(local.major_minor_maint[0], 10) : 0
  minor_version     = local.major_minor_maint != null ? parseint(local.major_minor_maint[1], 10) : 0
  maint_version     = local.major_minor_maint != null ? parseint(local.major_minor_maint[2], 10) : 0

  # Determine if the split disk feature is enabled. When the split_disk variable
  # is set, use it directly and skip the AMI lookup. Otherwise, auto-detect from
  # the AMI version.
  split_disk = var.split_disk != null ? var.split_disk : (local.major_version < 9 || (local.major_version == 9 && local.minor_version < 2) || (local.major_version == 9 && local.minor_version == 2 && local.maint_version < 2) ? false : true)
}
