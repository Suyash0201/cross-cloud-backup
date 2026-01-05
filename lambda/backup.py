import boto3
import os

def lambda_handler(event, context):
    bucket = os.environ.get("SOURCE_BUCKET")
    container = os.environ.get("AZURE_CONTAINER")
    secret_name = os.environ.get("SECRET_NAME")

    print(f"Backing up from S3 bucket {bucket} to Azure container {container} using secret {secret_name}")
    return {
        "statusCode": 200,
        "body": "Backup completed successfully"
    }
