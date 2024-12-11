output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "kind_cluster_instance_id" {
  value = module.kind_cluster_instance.id
}

output "kind_cluster_instance_public_ip" {
  value = module.kind_cluster_instance.public_ip
}

output "bucket_name" {
  value = module.s3_bucket.s3_bucket_id
}

output "bucket_arn" {
  value = module.s3_bucket.s3_bucket_arn
}