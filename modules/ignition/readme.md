## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0 |
| <a name="requirement_ignition"></a> [ignition](#requirement\_ignition) | 2.1.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ignition"></a> [ignition](#provider\_ignition) | 2.1.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ignition_config.k3s_ignition_config](https://registry.terraform.io/providers/community-terraform-providers/ignition/2.1.3/docs/data-sources/config) | data source |
| [ignition_file.hostname](https://registry.terraform.io/providers/community-terraform-providers/ignition/2.1.3/docs/data-sources/file) | data source |
| [ignition_file.k3s_install_script](https://registry.terraform.io/providers/community-terraform-providers/ignition/2.1.3/docs/data-sources/file) | data source |
| [ignition_file.silence_audit_messages](https://registry.terraform.io/providers/community-terraform-providers/ignition/2.1.3/docs/data-sources/file) | data source |
| [ignition_systemd_unit.k3s_install](https://registry.terraform.io/providers/community-terraform-providers/ignition/2.1.3/docs/data-sources/systemd_unit) | data source |
| [ignition_systemd_unit.qemu_ga](https://registry.terraform.io/providers/community-terraform-providers/ignition/2.1.3/docs/data-sources/systemd_unit) | data source |
| [ignition_user.core](https://registry.terraform.io/providers/community-terraform-providers/ignition/2.1.3/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hostname"></a> [hostname](#input\_hostname) | VM host name | `string` | `"k3s_server"` | no |
| <a name="input_ignition_name"></a> [ignition\_name](#input\_ignition\_name) | Name of the ignition data resource | `string` | n/a | yes |
| <a name="input_k3s_agent_options"></a> [k3s\_agent\_options](#input\_k3s\_agent\_options) | Options for k3s in agent mode | `map(string)` | <pre>{<br>  "K3S_SERVER_CHANNEL": "stable",<br>  "K3S_SERVER_EXEC": "--server",<br>  "K3S_TOKEN": "secret_cluster_token"<br>}</pre> | no |
| <a name="input_k3s_install_options"></a> [k3s\_install\_options](#input\_k3s\_install\_options) | Install options to pass to k3s-install.sh | `map(string)` | <pre>{<br>  "INSTALL_K3S_CHANNEL": "stable",<br>  "INSTALL_K3S_EXEC": "server --cluster-init"<br>}</pre> | no |
| <a name="input_k3s_server_options"></a> [k3s\_server\_options](#input\_k3s\_server\_options) | Options for k3s in server mode | `map(string)` | <pre>{<br>  "K3S_SERVER_CHANNEL": "latest",<br>  "K3S_SERVER_EXEC": "--server",<br>  "K3S_TOKEN": "secret_cluster_token"<br>}</pre> | no |
| <a name="input_ssh_authorized_keys"></a> [ssh\_authorized\_keys](#input\_ssh\_authorized\_keys) | SSH authorized keys to be added to the core user | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ignition_configuration"></a> [ignition\_configuration](#output\_ignition\_configuration) | n/a |
