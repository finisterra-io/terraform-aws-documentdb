variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "cluster_identifier" {
  type        = string
  description = "The cluster identifier. If omitted, Terraform will assign a random, unique identifier"
  default     = ""
}

variable "final_snapshot_identifier" {
  type        = string
  description = "The name of your final DB snapshot when this DB cluster is deleted. If omitted, no final snapshot will be made"
  default     = null
}

variable "snapshot_identifier" {
  type        = string
  default     = ""
  description = "Specifies whether or not to create this cluster from a snapshot. You can use either the name or ARN when specifying a DB cluster snapshot, or the ARN when specifying a DB snapshot"
}

variable "db_port" {
  type        = number
  default     = 27017
  description = "DocumentDB port"
}

variable "master_username" {
  type        = string
  default     = "admin1"
  description = "(Required unless a snapshot_identifier is provided) Username for the master DB user"
}

variable "master_password" {
  type        = string
  default     = ""
  description = "(Required unless a snapshot_identifier is provided) Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file. Please refer to the DocumentDB Naming Constraints"
}

variable "retention_period" {
  type        = number
  default     = 5
  description = "Number of days to retain backups for"
}

variable "preferred_backup_window" {
  type        = string
  default     = "07:00-09:00"
  description = "Daily time range during which the backups happen"
}

variable "preferred_maintenance_window" {
  type        = string
  default     = "Mon:22:00-Mon:23:00"
  description = "The window to perform maintenance in. Syntax: `ddd:hh24:mi-ddd:hh24:mi`."
}

variable "cluster_parameters" {
  type = list(object({
    apply_method = string
    name         = string
    value        = string
  }))
  default     = []
  description = "List of DB parameters to apply"
}

variable "cluster_family" {
  type        = string
  default     = "docdb3.6"
  description = "The family of the DocumentDB cluster parameter group. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-parameter-group-create.html"
}

variable "engine" {
  type        = string
  default     = "docdb"
  description = "The name of the database engine to be used for this DB cluster. Defaults to `docdb`. Valid values: `docdb`"
}

variable "engine_version" {
  type        = string
  default     = "3.6.0"
  description = "The version number of the database engine to use"
}

variable "storage_encrypted" {
  type        = bool
  description = "Specifies whether the DB cluster is encrypted"
  default     = true
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted"
  default     = null
}

variable "deletion_protection" {
  type        = bool
  description = "A value that indicates whether the DB cluster has deletion protection enabled"
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window"
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to cloudwatch. The following log types are supported: `audit`, `error`, `general`, `slowquery`"
  default     = []
}

variable "db_cluster_parameter_group_name" {
  type        = string
  description = "The name of a DB cluster parameter group to use"
  default     = ""
}

variable "create_random_password" {
  type        = bool
  description = "Whether to create a random password for the DocumentDB cluster"
  default     = false
}

variable "cluster_instances" {
  description = "List of DocumentDB cluster instances"
  type        = map(any)
}

### db subnet group ###

variable "enable_aws_docdb_subnet_group" {
  description = "Whether to create an AWS DocDB subnet group"
  type        = bool
  default     = false
}

variable "db_subnet_group_name" {
  description = "Name of the AWS DocDB subnet group"
  type        = string
  default     = ""
}

variable "db_subnet_group_description" {
  description = "Description of the AWS DocDB subnet group"
  type        = string
  default     = ""
}

variable "db_subnet_group_tags" {
  description = "Additional tags for the AWS DocDB subnet group"
  type        = map(string)
  default     = {}
}

### aws_docdb_cluster_parameter_group ###
variable "enable_aws_docdb_cluster_parameter_group" {
  description = "Whether to create an AWS DocDB cluster parameter group"
  type        = bool
  default     = false
}

variable "cluster_parameter_group_name" {
  description = "Name of the AWS DocDB cluster parameter group"
  type        = string
  default     = ""
}

variable "cluster_parameter_group_description" {
  description = "Description of the AWS DocDB cluster parameter group"
  type        = string
  default     = ""
}

variable "cluster_parameter_group_tags" {
  description = "Additional tags for the AWS DocDB cluster parameter group"
  type        = map(string)
  default     = {}
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = ""
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
  default     = []
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the cluster"
  type        = list(string)
  default     = []
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
  type        = string
  default     = ""
}

variable "subnet_ids" {
  description = "List of VPC subnet IDs to place DocumentDB instances in"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "VPC ID to create the cluster in (e.g. `vpc-a22222ee`)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
