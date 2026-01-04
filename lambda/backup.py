import boto3
from azure.storage.blob import BlobServiceClient
import os

def lambda_handler(event, context):
    s3 = boto3.client('s3')
    bucket_name = os.environ['SOURCE_BUCKET']
    azure_conn_str = os.environ['AZURE_CONN_STR']
    container_name = os.environ['AZURE_CONTAINER']

    blob_service_client = BlobServiceClient.from_connection_string(azure_conn_str)

    objects = s3.list_objects_v2(Bucket=bucket_name).get('Contents', [])
    for obj in objects:
        key = obj['Key']
        tmp_file = f"/tmp/{key.replace('/', '_')}"  # Lambda /tmp storage

        s3.download_file(bucket_name, key, tmp_file)

        blob_client = blob_service_client.get_blob_client(container=container_name, blob=key)
        with open(tmp_file, "rb") as data:
            blob_client.upload_blob(data, overwrite=True)

    return {"status": "success", "files_synced": len(objects)}