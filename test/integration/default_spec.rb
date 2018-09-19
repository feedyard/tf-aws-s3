# frozen_string_literal: true

require 'awspec'

describe s3_bucket('ci_test_bucket') do
  it { should exist }
  it { should have_versioning_enabled }
  it { should have_logging_enabled(target_bucket: 'ci_test_bucket', target_prefix: 'tf-state-log/') }
  it { should have_tag('pipeline').value('feedyard/tf-aws-state-bucket') }
end

describe s3_bucket('my-bucket') do
  its(:acl_owner) { should eq 'my-bucket-owner' }
  its(:acl_grants_count) { should eq 3 }
  it { should have_acl_grant(grantee: 'my-bucket-owner', permission: 'FULL_CONTROL') }
  it { should have_acl_grant(grantee: 'http://acs.amazonaws.com/groups/s3/LogDelivery', permission: 'WRITE') }
  it { should have_acl_grant(grantee: '68f4bb06b094152df53893bfba57760e', permission: 'READ') }
end



describe s3_bucket('my-bucket') do

end