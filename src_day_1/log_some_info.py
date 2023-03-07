import logging
import boto3

logger = logging.getLogger('MyLogger')
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    s3_bucket_name = event['Records'][0]['s3']['bucket']['name']
    logger.info(f'Bucket is {s3_bucket_name}')
    s3_object_name = event['Records'][0]['s3']['object']['key']
    logger.info(f'Object key is {s3_object_name}')

    s3 = boto3.client('s3')
    data = s3.get_object(Bucket=s3_bucket_name, Key=s3_object_name)
    contents = data['Body'].read()
    logger.info('File contents...')
    logger.info(f'{contents.decode("utf-8")}')
    