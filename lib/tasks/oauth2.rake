namespace :oauth2 do
  desc 'Generate authorize_url'
  task :authorize_url => :environment do
    puts Google::OAuth2::Session.new.authorize_url(scope: 'email profile')
  end
end
