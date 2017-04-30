guard :rspec, cmd: 'bundle exec rspec' do
  watch('spec/spec_helper.rb')                        { 'spec' }
  watch(%r{^lib/(.+)\.rb$})                           { |m| p m[1]; "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^spec/.+_spec\.rb$})
end
