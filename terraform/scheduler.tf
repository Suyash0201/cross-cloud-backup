resource "aws_cloudwatch_event_rule" "every_four_hours" {
  name                = "backup-every-4-hours"
  description         = "Triggers backup every 4 hours" [cite: 8]
  schedule_expression = "cron(0 */4 * * ? *)" 
}

# Example target (Lambda function to be defined in backup_logic.tf)
resource "aws_cloudwatch_event_target" "run_backup" {
  rule      = aws_cloudwatch_event_rule.every_four_hours.name
  target_id = "TriggerBackupLambda"
  arn       = aws_lambda_function.backup_sync.arn
}