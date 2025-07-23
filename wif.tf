# wif.tf - New file for WIF configuration
resource "shell_script" "wif_config" {
  count = var.only_deploy_infra_no_osd ? 0 : 1

  lifecycle_commands {
    create = templatefile(
      "${path.module}/templates/wifcreate.tftpl",
      {
        wif_config_name = var.wif_config_name
        gcp_project     = var.gcp_project
        wif_mode        = var.wif_mode
    })
    delete = templatefile(
      "${path.module}/templates/wifdelete.tftpl",
      {
        wif_config_name = var.wif_config_name
    })
  }
}