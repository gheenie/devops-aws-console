# The AWS Command Line Interface (CLI)

### Prerequisite
Launch a WhizLabs sandbox and note the Access Key ID and Secret Access Key. You should add these to a sandbox profile in your `.aws/credentials` file, similar to the following:
```text
[sandbox]
aws_access_key_id = AKIAXXXXXXXXXXXXXXXX
aws_secret_access_key = RhUbArbrHUBarbRhubAERbRhuBArbRhuBarB
```

You will need to activate your access by typing:
```bash
awsume sandbox
```

You can check you are connected by typing:
```bash
aws sts get-caller-identity
```
You should see a JSON structure containing account details that match yours.

Alternatively, just type:
```bash
aws s3 ls
```
If all is well this will return no results, but no error either.

## Tasks
The purpose of these tasks is to gain familiarity with accessing AWS resources using the API provided for the command line. We are going to just have a play with a couple of fun features that come included in the sandbox access you have. Neither of these tasks is crucial for future work. They are just intended for you to have a play with some AWS CLI commands. 

The instructions below are deliberately light on detail. A major part of what you need to do will be to track down the right documentation (remember which version of the CLI you are using...) and figure some of these steps out for yourselves.

There are no right answers. Just try to get as much of this to work as you can.

### Task 1
[Amazon Polly](https://aws.amazon.com/polly/) is text-to-speech software. You can give it some text in a number of different languages and it will speak them in a variety of voices.

Try the following:
1. Make an S3 bucket for storing text - make sure to give it a unique name.
1. Write a small text file in English and save it to your S3 bucket.
1. Make a small text file in a different language and save it to the same language.
1. Make a bucket for storing audio files.
1. Read the English text from S3
1. Get Amazon Polly to render a sound file of the text. Choose a voice and pronunciation for the rendered speech. [Challenge: can you get Polly to read in the sound file directly from S3?]
1. Save the resulting sound file to S3.
1. Repeat for the non English file, with a different voice.

[Note: Mac users can use the `afplay` command to play audio files from the terminal.]

As a (challenging) extension, can you set up and use a [bucket policy](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html) to manage access to your sound file bucket? You could open the bucket to other users so that they can download your sound file and listen to it.

### Task 2
[Amazon Rekognition](https://aws.amazon.com/rekognition/) is a machine-learning tool for image and video analysis. It tries to identify elements within pictures, often very well but sometimes with amusing errors. Use the CLI to try to fool it. Get some image files and pass them into Rekognition. You should get JSON output describing the picture. Does the software detect people and faces? Can it tell what mood they are in or what they are doing? Can it recognise celebrities? Try it out - but just with the CLI...

Extension: can you use `jq` to extract some of the attributes of the output?
