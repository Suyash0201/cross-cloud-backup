import boto3
from azure.storage.blob import BlobServiceClient
import os

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    bucket_name = os.environ['SOURCE_BUCKET']
    azure_conn_str = os.environ['AZURE_CONN_STR']
    container_name = os.environ['AZURE_CONTAINER']

    blob_service_client = BlobServiceClient.from_connection_string(azure_conn_str)
    blob_container = blob_service_client.get_container_client(container_name)

    files_synced = 0
    paginator = s3.get_paginator('list_objects_v2')

    for page in paginator.paginate(Bucket=bucket_name):
        for obj in page.get('Contents', []):
            key = obj['Key']
            try:
                s3_object = s3.get_object(Bucket=bucket_name, Key=key)
                blob_client = blob_container.get_blob_client(key)
                blob_client.upload_blob(s3_object['Body'], overwrite=True)
                files_synced += 1
            except Exception as e:
                print(f"Error syncing {key}: {e}")

    return {"status": "success", "files_synced": files_synced}
