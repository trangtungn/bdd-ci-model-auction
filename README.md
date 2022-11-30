# README

This Rails app follows this article [How to Test Rails Models with RSpec](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec#h-what-is-behaviour-driven-development) which should cover the followings:

1. TDD?

   - [Test Driven Development](https://semaphoreci.com/blog/test-driven-development)
   - Test-First Programming
   - allows **short feedback loops** where developers write just the right amount of code and design to make the software work

     ![TDD](public/images/tdd.jpeg)

2. BDD?

   - [Behavior-Driven Development](https://semaphoreci.com/community/tutorials/behavior-driven-development)
   - is a software development process which is about minimizing feedback loop
   - combines **Test Driven Development**
   - what, not how: We think about what the system does, rather than how it does it.
   - is not UI testing

     ![BDD](public/images/bdd.jpeg)

3. Test models (Bid, Auction, User)

4. Test business logic (BiddingEngine)

5. Use CI to automate testing

   - [CI with Semaphore](https://semaphoreci.com/continuous-integration)
   - [CI Pipeline](https://semaphoreci.com/blog/cicd-pipeline)
   - [Dockerizing a RoR app](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application)
