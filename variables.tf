variable "zone_id" {
  type        = string
  default     = ""
  description = "Route53 parent zone ID. If provided (not empty), the module will create sub-domain DNS records for the DocumentDB master and replicas"
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

variable "allowed_security_groups" {
  type        = list(string)
  default     = []
  description = "List of existing Security Groups to be allowed to connect to the DocumentDB cluster"
}

variable "allow_ingress_from_self" {
  type        = bool
  default     = false
  description = "Adds the Document DB security group itself as a source for ingress rules. Useful when this security group will be shared with applications."
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = []
  description = "List of CIDR blocks to be allowed to connect to the DocumentDB cluster"
}

variable "instance_class" {
  type        = string
  default     = "db.r4.large"
  description = "The instance class to use. For more details, see https://docs.aws.amazon.com/documentdb/latest/developerguide/db-instance-classes.html#db-instance-class-specs"
}

variable "cluster_size" {
  type        = number
  default     = 3
  description = "Number of DB instances to create in the cluster"
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

variable "auto_minor_version_upgrade" {
  type        = bool
  description = "Specifies whether any minor engine upgrades will be applied automatically to the DB instance during the maintenance window or not"
  default     = true
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to cloudwatch. The following log types are supported: `audit`, `error`, `general`, `slowquery`"
  default     = []
}

variable "cluster_dns_name" {
  type        = string
  description = "Name of the cluster CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `master.var.name`"
  default     = ""
}

variable "reader_dns_name" {
  type        = string
  description = "Name of the reader endpoint CNAME record to create in the parent DNS zone specified by `zone_id`. If left empty, the name will be auto-asigned using the format `replicas.var.name`"
  default     = ""
}

variable "enable_performance_insights" {
  type        = bool
  description = "Specifies whether to enable Performance Insights for the DB Instance."
  default     = false
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


##### Security group #####
variable "security_group_name" {
  type        = string
  description = "Name of the security group to create for the DocumentDB cluster"
  default     = ""
}

variable "security_group_description" {
  type        = string
  description = "Description of the security group to create for the DocumentDB cluster"
  default     = ""
}

variable "security_group_tags" {
  type        = map(string)
  description = "Additional tags for the security group to create for the DocumentDB cluster"
  default     = {}
}

### cluster instance ### 

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


## KMS ##
variable "kms_key_name" {
  description = "Name of the KMS key"
  type        = string
  default     = ""
}

variable "kms_description" {
  description = "Description of the KMS key"
  type        = string
  default     = ""
}

variable "kms_tags" {
  description = "Additional tags for the KMS key"
  type        = map(string)
  default     = {}
}

variable "kms_policy" {
  description = "Policy of the KMS key"
  type        = string
  default     = ""
}

variable "kms_enable_key_rotation" {
  description = "Whether to enable key rotation for the KMS key"
  type        = bool
  default     = false
}

variable "kms_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days"
  type        = number
  default     = 30
}

variable "create_kms_key" {
  description = "Whether the KMS key is enabled"
  type        = bool
  default     = true
}

variable "create_security_group" {
  description = "Whether the security group is enabled"
  type        = bool
  default     = false
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