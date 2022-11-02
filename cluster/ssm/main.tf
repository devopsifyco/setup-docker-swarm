resource "aws_ssm_document" "instance_creation" {
  name          = "${local.global_name}-instances_creation"
  document_type = "Automation"
  content = templatefile("${path.module}/ssm-instance-creation.yaml", {
    automationAssumeRole   = var.role_execute_arn
    CloudWatchLogGroupName = var.instance_creation_logs
    ASGName                = "${local.global_name}-asg"
    MasterIPStore          = aws_ssm_parameter.master_ip.name
    JoinTokenStore         = aws_ssm_parameter.join_token.name
  })
  document_format = "YAML"
  tags            = local.global_tags
}

resource "aws_ssm_document" "instance_removal" {
  name          = "${local.global_name}-instances_removal"
  document_type = "Automation"
  content = templatefile("${path.module}/ssm-instance-removal.yaml", {
    automationAssumeRole   = var.role_execute_arn
    CloudWatchLogGroupName = var.instance_removal_logs
  })
  document_format = "YAML"
  tags            = local.global_tags
}

resource "aws_ssm_parameter" "master_ip" {
  name        = "${local.global_name}-master_ip"
  description = "The parameter description"
  type        = "String"
  value       = "${local.global_name}-master_ip"
  tags        = local.global_tags
}

resource "aws_ssm_parameter" "join_token" {
  name        = "${local.global_name}-join_token"
  description = "The parameter description"
  type        = "String"
  value       = "${local.global_name}-join_token"
  tags        = local.global_tags
}