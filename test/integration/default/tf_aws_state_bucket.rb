# frozen_string_literal: true

describe aws_s3_bucket('feedyard-ci-test-bucket') do
  it { should exist }
  it { should_not be_public }
  it { should have_default_encryption_enabled }
end
