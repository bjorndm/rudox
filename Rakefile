

require 'rake/testtask'

include Rake::DSL

# Run the tests

Rake::TestTask.new do |t|
  t.libs      << "test"
  t.test_files  = FileList['test/test_*.rb'] + FileList['test/**/test_*.rb']
  t.verbose    = true
end


