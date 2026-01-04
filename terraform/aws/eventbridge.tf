resource "aws_cloudwatch_event_rule" "backup_schedule" {
  name                = "s3-to-azure-backup-schedule"
  description         = "Trigger Lambda every 4 hours"
  schedule_expression = "cron(0 */4 * * ? *)"
}

resource "aws_cloudwatch_event_target" "backup_target" {
  rule      = aws_cloudwatch_event_rule.backup_schedule.name
  target_id = "lambda-backup"
  arn       = aws_lambda_function.s3_to_azure.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_to_azure.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.backup_schedule.arn
}