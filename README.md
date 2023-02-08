# README

This Rails app follows this article [How to Test Rails Models with RSpec](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec#h-what-is-behaviour-driven-development) which should cover the followings:

1. TDD?

   - [Test Driven Development](https://semaphoreci.com/blog/test-driven-development)
   - Test-First Programming
   - allows **short feedback loops** where developers write just the right amount of code and design to make the software work


     ![TDD](public/images/tdd.jpeg)

   - [Mocking technique](https://semaphoreci.com/community/tutorials/mocking-with-rspec-doubles-and-expectations)

2. BDD?

   - [Behavior-Driven Development](https://semaphoreci.com/community/tutorials/behavior-driven-development)
   - is a software development process which is about minimizing feedback loop
   - combines **Test Driven Development**
   - what, not how: We think about what the system does, rather than how it does it.
   - is not UI testing.
   - Tool: Cucumber testing framework (can be used by BAs or POs).

     ![BDD](public/images/bdd.jpeg)

3. Test models (Bid, Auction, User)

4. Test business logic (BiddingEngine)

5. Use CI to automate testing

   - [CI with Semaphore](https://semaphoreci.com/continuous-integration)
   - [CI Pipeline](https://semaphoreci.com/blog/cicd-pipeline)
   - [Dockerizing a RoR app](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application)

6. Tools:
   - **Capybara**: for writing integration tests. System tests use Capybara under the hood.
   - [**Cucumber**](https://medium.com/@enikozsoldos93/cucumber-in-ruby-on-rails-1a4c2561ae54): for behavior-driven development (BDD), which allows developers to write tests in a natural language syntax.

7. Rails System Testing:

         require "rails_helper"

         RSpec.describe "Post management", type: :system do
            it "creates a new post" do
               visit new_post_path
               fill_in "Title", with: "My First Post"
               fill_in "Body", with: "This is the body of my first post."
               click_on "Create Post"

               expect(page).to have_content("Post was successfully created")
               expect(page).to have_content("My First Post")
               expect(page).to have_content("This is the body of my first post.")
            end
         end

   - interacts with application using Capybara
   - type: :system


8. Rails Integration Testing:

         require "rails_helper"

         RSpec.describe "Post management", type: :request do
            it "creates a new post" do
               post posts_path, params: { post: { title: "My First Post", body: "This is the body of my first post." } }
               follow_redirect!

               expect(response).to have_http_status(:ok)
               expect(response.body).to include("Post was successfully created")
               expect(response.body).to include("My First Post")
               expect(response.body).to include("This is the body of my first post.")
            end
         end


   - type: :request
   - uses RSpec/Capybara syntax
   - focuses on testing the interactions between different parts of a web application

9. Rails Functional Testing:

         require "rails_helper"

         RSpec.describe PostsController, type: :controller do
            describe "GET #index" do
               it "returns a success response" do
                  get :index
                  expect(response).to be_successful
               end
            end

            describe "GET #show" do
               it "returns a success response" do
                  post = Post.create!(title: "My First Post", body: "This is the body of my first post.")
                  get :show, params: { id: post.to_param }
                  expect(response).to be_successful
               end
            end
         end

   - Example with Capybara:

         require "rails_helper"

         RSpec.describe PostsController, type: :controller do
            describe "GET #new" do
               it "renders the new template" do
                  get :new
                  expect(response).to render_template(:new)
               end
            end

            describe "POST #create" do
               it "creates a new post" do
                  post :create, params: { post: { title: "My First Post", body: "This is the body of my first post." } }
                  expect(response).to redirect_to(post_path(assigns(:post)))
               end
            end
         end

   - type: :controller

10. [Capybara](https://semaphoreci.com/community/tutorials/integration-testing-ruby-on-rails-with-minitest-and-capybara#what-is-integration-testing):
   - an acceptance test framework for webapp.
   - to do end-to-end testing in Rails applications.
   - to simulate a user on a web page and interact with the web page.
   - runs in headless mode by default.

11. References:

   - [Intro RSpec and Capybara testing](https://rubyyagi.com/intro-rspec-capybara-testing/)
   - [Cucumber](https://medium.com/@enikozsoldos93/cucumber-in-ruby-on-rails-1a4c2561ae54)
   - [Rails Functional Testing](https://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers)
   - [Rails Integration Testing](https://guides.rubyonrails.org/testing.html#integration-testing)
   - [Rails System Testing](https://guides.rubyonrails.org/testing.html#system-testing)
   - [Mocking with RSpec: Doubles and Expectations](https://semaphoreci.com/community/tutorials/mocking-with-rspec-doubles-and-expectations)
   - [Integration Testing Ruby on Rails with Minitest and Capybara](https://semaphoreci.com/community/tutorials/integration-testing-ruby-on-rails-with-minitest-and-capybara#what-is-integration-testing)