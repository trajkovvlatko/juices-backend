CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['JUICES_AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['JUICES_AWS_SECRET_ACCESS_KEY'],
    region: ENV['JUICES_AWS_REGION']
  }

  config.fog_directory = ENV['JUICES_S3_BUCKET_NAME']
  config.storage = :fog
end
