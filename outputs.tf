output "elasticache_replication_group_id" {
  value       = "${aws_elasticache_replication_group.default.id}"
  description = "The ID of the ElastiCache Replication Group."
}

output "elasticache_replication_group_primary_endpoint_address" {
  # value       = "${ join("", aws_elasticache_replication_group.default.primary_endpoint_address) }" # conditional output hack

  value = "${element(compact(concat(list(var.replicas_per_node_group == "0" ? "" : "Not set"), list(aws_elasticache_replication_group.default.primary_endpoint_address))), 0)}"
  # value = "${element(concat(foo, list("default"), 0)}"
  description = "The address of the endpoint for the primary node in the replication group."
}

output "elasticache_replication_group_member_clusters" {
  # value       = "${ join("", aws_elasticache_replication_group.default.member_clusters) }"  # conditional output hack
  value = "${element(compact(concat(list(var.replicas_per_node_group == "0" ? "" : "Not set"), list(aws_elasticache_replication_group.default.member_clusters))), 0)}"
  description = "The identifiers of all the nodes that are part of this replication group."
}

output "elasticache_replication_group_configuration_endpoint_address" {
  # value       = "${ join("", list(aws_elasticache_replication_group.default.configuration_endpoint_address)) }"   # conditional output hack
  value = "${element(compact(concat(list(var.replicas_per_node_group != "0" ? "" : "Not set"), list(aws_elasticache_replication_group.default.configuration_endpoint_address))), 0)}"
  description = "The address of the replication group configuration endpoint when cluster mode is enabled."
}

output "elasticache_parameter_group_id" {
  value       = "${aws_elasticache_parameter_group.default.id}"
  description = "The ElastiCache parameter group name."
}

output "security_group_id" {
  value       = "${aws_security_group.default.id}"
  description = "The ID of the Redis ElastiCache security group."
}

output "security_group_arn" {
  value       = "${aws_security_group.default.arn}"
  description = "The ARN of the Redis ElastiCache security group."
}

output "security_group_vpc_id" {
  value       = "${aws_security_group.default.vpc_id}"
  description = "The VPC ID of the Redis ElastiCache security group."
}

output "security_group_owner_id" {
  value       = "${aws_security_group.default.owner_id}"
  description = "The owner ID of the Redis ElastiCache security group."
}

output "security_group_name" {
  value       = "${aws_security_group.default.name}"
  description = "The name of the Redis ElastiCache security group."
}

output "security_group_description" {
  value       = "${aws_security_group.default.description}"
  description = "The description of the Redis ElastiCache security group."
}

output "security_group_ingress" {
  value       = "${aws_security_group.default.ingress}"
  description = "The ingress rules of the Redis ElastiCache security group."
}

output "security_group_egress" {
  value       = "${aws_security_group.default.egress}"
  description = "The egress rules of the Redis ElastiCache security group."
}
