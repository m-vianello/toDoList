# creation and basic set upprocess
1. rails new todolist -T -d postgresql
2. initial commit with ~83 files
3. check rails console
  if errors ~= "net/protocol.rb:66: warning: already initialized constant Net::ProtocRetryError"
   add gem 'net-http'

4. inside gem file develompent test add:
  gem 'database_cleaner'
  gem "pry"
  gem 'rspec-rails'
  gem 'factory_bot_rails'

5. run rspec --init
  this outputs
  create   .rspec
  create   spec/spec_helper.rb

6. rails db:create
7. rails g migration create_tasks
  outputs db/migrate/20230316191902_create_tasks.rb

8. rails db:migrate
9. add model
10. add seeds
11. rails db:seed / confirm creation in console
12. initial commit db working
13. rails server
14. add controller, view, and routing for tasks
15. index
16. show
17. create
18. edit
19. delete


# adding bootstrap to rails
1. https://mixandgo.com/learn/ruby-on-rails/how-to-install-bootstrap

# adding js

# deploy