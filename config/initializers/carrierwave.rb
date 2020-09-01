require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws[:aws_access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:aws_secret_access_key],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'web-share-image'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/web-share-image'
    config.cache_storage = :fog
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end