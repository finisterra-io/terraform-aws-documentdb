
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_docdb_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster_instance.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_cluster_parameter_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_parameter_group) | resource |
| [aws_docdb_subnet_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_subnet_group) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [aws_subnet.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window | `bool` | `null` | no |
| <a name="input_cluster_family"></a> [cluster\_family](#input\_cluster\_family) | The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html | `string` | `"docdb3.6"` | no |
| <a name="input_cluster_identifier"></a> [cluster\_identifier](#input\_cluster\_identifier) | The cluster identifier. If omitted, Terraform will assign a random, unique identifier | `string` | `""` | no |
| <a name="input_cluster_instances"></a> [cluster\_instances](#input\_cluster\_instances) | List of DocumentDB cluster instances | `map(any)` | n/a | yes |
| <a name="input_cluster_parameter_group_description"></a> [cluster\_parameter\_group\_description](#input\_cluster\_parameter\_group\_description) | Description of the AWS DocDB cluster parameter group | `string` | `""` | no |
| <a name="input_cluster_parameter_group_name"></a> [cluster\_parameter\_group\_name](#input\_cluster\_parameter\_group\_name) | Name of the AWS DocDB cluster parameter group | `string` | `""` | no |
| <a name="input_cluster_parameter_group_tags"></a> [cluster\_parameter\_group\_tags](#input\_cluster\_parameter\_group\_tags) | Additional tags for the AWS DocDB cluster parameter group | `map(string)` | `{}` | no |
| <a name="input_cluster_parameters"></a> [cluster\_parameters](#input\_cluster\_parameters) | List of DB parameters to apply | <pre>list(object({<br>    apply_method = string<br>    name         = string<br>    value        = string<br>  }))</pre> | `[]` | no |
| <a name="input_create_random_password"></a> [create\_random\_password](#input\_create\_random\_password) | Whether to create a random password for the DocumentDB cluster | `bool` | `false` | no |
| <a name="input_db_cluster_parameter_group_name"></a> [db\_cluster\_parameter\_group\_name](#input\_db\_cluster\_parameter\_group\_name) | The name of a DB cluster parameter group to use | `string` | `""` | no |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | DocumentDB port | `number` | `27017` | no |
| <a name="input_db_subnet_group_description"></a> [db\_subnet\_group\_description](#input\_db\_subnet\_group\_description) | Description of the AWS DocDB subnet group | `string` | `""` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | Name of the AWS DocDB subnet group | `string` | `""` | no |
| <a name="input_db_subnet_group_tags"></a> [db\_subnet\_group\_tags](#input\_db\_subnet\_group\_tags) | Additional tags for the AWS DocDB subnet group | `map(string)` | `{}` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | A value that indicates whether the DB cluster has deletion protection enabled | `bool` | `false` | no |
| <a name="input_enable_aws_docdb_cluster_parameter_group"></a> [enable\_aws\_docdb\_cluster\_parameter\_group](#input\_enable\_aws\_docdb\_cluster\_parameter\_group) | Whether to create an AWS DocDB cluster parameter group | `bool` | `false` | no |
| <a name="input_enable_aws_docdb_subnet_group"></a> [enable\_aws\_docdb\_subnet\_group](#input\_enable\_aws\_docdb\_subnet\_group) | Whether to create an AWS DocDB subnet group | `bool` | `false` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | List of log types to export to cloudwatch. The following log types are supported: `audit`, `error`, `general`, `slowquery` | `list(string)` | <pre>[<br>  "audit"<br>]</pre> | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The name of the database engine to be used for this DB cluster. Defaults to `docdb`. Valid values: `docdb` | `string` | `"docdb"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version number of the database engine to use | `string` | `"3.6.0"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true` | `string` | `null` | no |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | (Required unless a snapshot\_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocumentDB Naming Constraints | `string` | `""` | no |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | (Required unless a snapshot\_identifier is provided) Username for the master DB user | `string` | `"admin1"` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | Daily time range during which the backups happen | `string` | `"07:00-09:00"` | no |
| <a name="input_preferred_maintenance_window"></a> [preferred\_maintenance\_window](#input\_preferred\_maintenance\_window) | The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`. | `string` | `"Mon:22:00-Mon:23:00"` | no |
| <a name="input_retention_period"></a> [retention\_period](#input\_retention\_period) | Number of days to retain backups for | `number` | `5` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted | `bool` | `null` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot | `string` | `""` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted | `bool` | `true` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of VPC subnet IDs to place DocumentDB instances in | `list(string)` | `[]` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | List of subnet names | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create the cluster in (e.g. `vpc-a22222ee`) | `string` | `""` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC | `string` | `""` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security group IDs to associate with the cluster | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Amazon Resource Name (ARN) of the cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Cluster Identifier |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Endpoint of the DocumentDB cluster |
| <a name="output_master_username"></a> [master\_username](#output\_master\_username) | Username for the master DB user |
| <a name="output_reader_endpoint"></a> [reader\_endpoint](#output\_reader\_endpoint) | A read-only endpoint of the DocumentDB cluster, automatically load-balanced across replicas |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
