# aws s3 cp english.txt s3://infoomics-demo/english.txt
# aws s3 cp french.txt s3://infoomics-demo/french.txt

# aws polly start-speech-synthesis-task --output-format mp3 --voice-id Joanna --endpoint-url 'https://polly.us-east-1.amazonaws.com/' --region us-east-1 --output-s3-bucket-name infoomics-audio --text file://english.txt
# aws polly start-speech-synthesis-task --output-format mp3 --voice-id Joanna --endpoint-url 'https://polly.us-east-1.amazonaws.com/' --region us-east-1 --output-s3-bucket-name infoomics-audio --text file://french.txt --language-code fr-FR

# aws s3 cp s3://infoomics-audio/084eb6c8-7e52-4548-a2d7-83dcb691488b.mp3 read_as_english.mp3
# aws s3 cp s3://infoomics-audio/765561b9-7474-474f-9078-e76f7ad9dd19.mp3 read_as_french.mp3

# NOT WORKING
# aws polly synthesize-speech --output-format mp3 --voice-id Joanna --endpoint-url 's3://infoomics-audio/polly_english.txt' --text file://english.txt


# For making an actual AWS policy.
# If using this method, remove Principal property from .json file.
# aws iam create-policy --policy-name download_from_bucket --policy-document file://policy_download_from_bucket.json

# If using actual AWS policy, --policy's argument changes.
# aws s3api put-bucket-policy --bucket infoomics-demo --policy file://policy_download_from_bucket.json

# curl https://infoomics-demo.s3.amazonaws.com/english.txt -o english.txt


# aws s3 cp group_of_people.jpg s3://infoomics-demo/group_of_people.jpg
# aws s3 cp celebrities.jpg s3://infoomics-demo/celebrities.jpg

# aws rekognition detect-labels --image file://request.json > response.json
# aws rekognition detect-faces --image file://request.json --attributes ALL > response.json
aws rekognition recognize-celebrities --image file://request.json > response.json

# RESPONSE=$(aws rekognition detect-labels --image file://request.json)

# echo $RESPONSE | jq .Labels[0].Name
