require 'aws-sdk-core'

$credentials = Aws::Credentials.new(ENV.fetch("AWS_ACCESS_KEY_ID"), ENV.fetch("AWS_SECRET_ACCESS_KEY"))

Aws.config.update(
  region: 'us-west-2',
  credentials: $credentials
)

# ec2 = Aws::EC2::Client.new(region: ENV.fetch("AWS_REGION"), credentials: $credentials)
$ec2 = Aws::EC2::Resource.new(region: ENV.fetch("AWS_REGION"), credentials: $credentials)
