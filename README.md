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


# adding bootstrap to rails/figureout out JS
1. https://mixandgo.com/learn/ruby-on-rails/how-to-install-bootstrap
2. went to gem page https://rubygems.org/gems/cssbundling-rails
3. added gem to gemfile/ bundle
4. ran installer: rails css:install:bootstrap
5. transferred navbar from todo_sinatra and realized didnt know how to get JS in rails working
6. git co changes but 4 files remained
7. created branch to figure out how to get red/blue button function working as example
8. js functions live in application.js to access them in views "export" by setting window.function = function
9. added gem back to gem file and ran installer (nothing seems broken based on console outputs)
10. again transfer navbar
  - comment out erroneous tags in application.html.erb
  - add bootstrap style link to head of application.html.erb (this might be because i deleted and reinstalled)
  - add bootstrap script tag to body of application.html.erb
11. the offcanvas js is not installed yet so the navbar is not function correctly when screen size is small
12. continue with mixandgo directions
13. in application.html.erb change
  <%= javascript_include_tag "application", "data-turbo-track": "reload", defer: true %>
  to
  <%= javascript_include_tag "/assets/application.js", "data-turbo-track": "reload", defer: true%>
14. red/blue button no longer working(removed controllers suggestion from mixandgo to fix red/blue)
15. navbar is not function correctly still

16. npm i bootstrap-icons

# adding js

# deploy