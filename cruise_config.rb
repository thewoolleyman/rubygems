# Project-specific configuration for CruiseControl.rb
require 'socket'

Project.configure do |project|
  
  #project.email_notifier.emails = ['rubygems-developers@rubyforge.org'] if Socket.gethostname =~ /cibuilder.pivotallabs.com/
  project.email_notifier.from = 'devnull+rubygems-ci@pivotallabs.com'

  interpreter = Regexp.new(/RubyGems-(.*)$/i).match(project.name)[1]
  interpreter.gsub!('_','.')
  project.build_command = "./ci_build.sh '#{interpreter}@rubygems'"
  project.scheduler.polling_interval = 5.minutes

end
