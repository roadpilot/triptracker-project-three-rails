# Instructions

- [X] 1. Create a new repository on GitHub for your Rails application.
- [X] 2. When you create the Rails app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub. You will use this file as a personal checklist of requirements as you complete the project.
- [X] 3. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable. **This is important and you'll be graded on this**.
- [X] 4. Record at least a 30 min coding session. During the session, either think out loud or not. It's up to you. You don't need to submit it, but we may ask for it at a later time.
- [X] 5. Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement *before* you submit your project.
- [X] 6. Write a README.md.
- [X] 7. Submit a video of how a user would interact with your working web application.
DEMO:
- login validation errors (new)
    = dup handle (roadpilot)
    = dup email (test@mail.com)
- login as new user
- logout
- login validation errors (existing)
    = pw wrong
    = handle wrong
- login as existing user
- logout
- login as github
- create trip
- read trip
- update trip
- add location
- delete location
- update time in / time out
- delete trip
- test for unauth access
- logout
- test for logged out access

- [X] 8. Write a blog post about the project and process.
- [X] 9. When done, submit your GitHub repo's url, a link to your video demo, and a link to your blog post in the corresponding text boxes in the right rail. Hit "I'm done" to wrap it up.

# Specifications for the Rails Assessment

Specs:
- [X] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [X] Include signup (how e.g. Devise)
- [X] Include login (how e.g. Devise)
- [X] Include logout (how e.g. Devise)
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [X] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate

# Project Order of Operations Guide

## Checklist

### PART 1 — Project Setup: MVC, ActiveRecord

**BEFORE YOU CODE**
- [X] 1. Check project requirements in `spec.md`
- [X] 2. Ideate! What do you want to build?
  - choose a domain you're familiar with!
  - choose a domain you care about
- [X] 3. Wireframing & User Stories
  - Write down your models, their attributes, and their associations
  - "As a user, I can ....."
  - "A user should be able to ....."
  - What does your app _do_?
- [X] 4. Design your MVP = 'Minimum Viable Product' vs. what are my 'stretch goals'
  - Stretch goals - bonus features you want but don't need

**NOW WE CODE (BUT JUST OUR MODELS — NO CONTROLLERS OR VIEWS)**

- [X] 5. Generate new project using rails new
- [X] 6. Create github repo
- [X] 7. Build your models
  - Migrations
  - Model classes
  - Associations
# User:
    has many trips
    has many comments
# Location:
    belongs to user
    belongs to trip
    has many comments
    has many trips through trip_locations
# Trip:
    belongs to user
    belongs to location
    has many locations through trip_locations
# Comment:
    belongs to user
    belongs to location
trips will relate to locations through trip_locations join table
-user_id
-location_id
-time_in
-time_out

# Build resources
rails g resource User handle:string email:string password_digest:string --no-test-framework
rails g resource Location address:string business_name:string user_id:integer --no-test-framework
rails g resource Trip user_id:integer --no-test-framework
rails g resource Comment comment:string user_id:integer location_idinteger --no-test-framework
rails g resource trip_location trip_id:integer location_id:integer time_in:string time_out:string --no-test-framework

- [X] 8. Test your models and associations in the console
  - Create some seed data
  - Tested our associations in `tux` or rails console
  - Adjust migrations as needed

### PART 2 — User Authentication: Login + Sign Up

**NOW, CONSIDER USER CONTROLLER, APPLICATION CONTROLLER, AND VIEWS**

*IMPORTANT:* Build views and controller actions based on the flow of your app, one step at a time, testing as you go!

- Use `pry` (or `raise`/`inspect`) all the time!

**START WITH LOGIN**

- [X] 9. Create your `UsersController`

- [X] 10. NOT APPLICABLE

- [X] 11. Build routes and views for login
  - Build your `get` login route + "login" view
  - Build your `post` login route
      - **Tip**: Here is where we authenticate the user and leverage the session hash to log them in!
  - Build your `get users/:id` route + "show" view

- [X] 12. Create your `ApplicationController` helper methods
  - **Ask**: Why do we add this?
  - `#logged_in?`: checks if the user is logged in
  - `#current_user`: keeps track of the user currently logged in

**MOVE ON TO SIGN UP**
- [X] 13. Build routes and views for signup
  - Build your `get` signup route + "signup" view
  - Build your `post` signup route

**WRAP UP WITH LOG OUT**
- [X] 14. Build your `get` logout route

### PART 3 — CRUD: Create, Read, Update, Delete

- [X] 15. Create your `PostsController`
  (TripsController) - created with resource gen
  - Mount new controller in `config.ru` with `use PostsController`
  - **Ask**: Why do we add this? ^ (SINATRA ONLY)

- [X] 16. Implement READ functionality
  - Create `get` trips route
  - Create a view for displaying all trips

- [X] 17. Implement CREATE functionality
  - Create `get` posts route and view to render form
  - Create `post` route to create new post

- [X] 18. Implement UPDATE functionality
  - Add `use Rack::MethodOverride` in `config.ru`
  - **Ask**: Why do we add this? ^
  - Create `get` route and view to render form
  - Create `patch` route to update an existing post

- [X] 19. Implement DELETE functionality
  - Create `delete` form in relevant view
  - Create `delete` route to delete post

### PART 4 — Tighten Up!: Validations and Authorization
- [X] 20. Implement `sinatra-flash` gem to display validation failures and improve user experience (UX)
  - Review the [docs](https://github.com/SFEley/sinatra-flash)
  - **Tip**: a `flash[:message]` has the lifecyle of one `GET` request and will not show up when rendering an `erb` file.
- [X] 21. Include ActiveRecord validations in your `User` and `Post` model that checks for user inputs
  - **Ex**: Making sure all form fields are filled out or that a user is using a unique email or username
  - Review the [docs](https://guides.rubyonrails.org/active_record_validations.html)
  - **Tip**: `has_secure_password` has a built in validation for the `password_digest` attribute!
- [X] 22. Leverage the `logged_in?` helper method in the controller and/or views to implement authorization for creating a new post.
  - Make sure a user can't create a new post without being logged in.
- [X] 23. Implement authorization to edit and delete.
  - Make sure a user can't edit or delete a post that doesn't belong to them.
- [X] 24. Refactor your code to make it more DRY!
  - **Ask**: Where am I repeating myself?
- [X] 25. Create a `README.md`
  - Include a short description, install instructions, a contributors guide and a link to the license for your code

### Bonus
- [ ] Leverage a CSS framework to improve the styling of your application
  - Easiest to implement: [Bulma](https://bulma.io/)
  - Most popular: [Bootstrap](https://getbootstrap.com/)
  - Also good: [Semantic UI](https://semantic-ui.com/)
  - Not bootstrap: [Materialize](https://materializecss.com/)

