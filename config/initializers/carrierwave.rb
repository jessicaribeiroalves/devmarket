CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = Rails.application.credentials.aws[:s3_bucket_name]
  config.aws_acl = "public-read"

  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: "max-age=604800",
  }

  config.aws_credentials = {
    access_key_id: Rails.application.credentials.aws[:access_key_id],
    secret_access_key: Rails.application.credentials.aws[:secret_access_key],
    region: Rails.application.credentials.aws[:region],
    stub_responses: Rails.env.test?, # Optional, avoid hitting S3 actual during tests
  }
end
