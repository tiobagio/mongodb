# # encoding: utf-8

# Inspec test for recipe mongodb::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

#
# not supported?:  describe port( node['default']['mongodb']['port'] ) do
describe port( 27017 ) do
  it { should be_listening }
end

describe service('mongod') do
  it { should be_installed }
  it { should be_enabled }
end
