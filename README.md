# RAILS PROJECT APP - DevMarket

1. Link to [published app on Heroku](http://dev-market-aus.herokuapp.com/)
2. Link to [Github Repo](https://github.com/jessicaribeiroalves/devmarket). The 2 remaining team members forked this repo and merged code into.
   
##1. What is the need (i.e. challenge) that you will be addressing in your project?
We have 2 user types for our app;
the first are junior developers with 0-2 years of industry experience
the second set of users are self-employed professionals (like accountants, lawyers etc). We are focusing on white collar professionals and small businesses of up to 5 staff, at the most.

**USER: Needs of Junior Developer**
From the perspective of the junior developer, their needs are;
1. To build a strong portfolio of work to pitch for better work and jobs in the future and to ensure higher chances of employability
2. To build work readiness and client service skills (alongside their technical skills)

**USER AND CUSTOMER: Self-employed business owner**
From the perspective of the business owner,their core need is to;
1. To find trusted and reliable contractors to meet their small, ad-hoc digital needs and can deliver quick results

##2. Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?
*For Business Owners*
It's a problem that needs solving because because self-employed professionals constantly have small, ad-hoc website and digital tasks that need completion and they don't have skills, a large budget or  in-house software developers to help them do this. According to Smart Company, over half of small business owners still don't have a website as yet (https://www.smartcompany.com.au/technology/seo/small-businesses-websites-seo/)

They also may not have a huge budget to pay for these smaller tasks which means agencies are too expensive for them. Finally they need quick turnaround for these smaller tasks so their business can keep running.


*For Junior Developers*
It's a problem for junior developers because;
1. Their lack of industry experience and work readiness skills could serve as barriers preventing them from entering the job market (See  Computerworld(https://www.computerworld.com.au/article/600399/challenges-hiring-software-engineers-australia/)
2. Due to higher levels of competition amongst junior developers for work (compared to mid-senior developers), junior developers needs a strong and robust portfolio to help secure quality employment opportunities

**Why is it a problem that needs solving?**
It is a problem worth solving because our customers (i.e the business owners) are already looking for solutions to their digital problems - but may be looking for places where they are not getting the best result. These needs are also important for the running of their businesses in this day and age - they need a quality web presence. 

For the junior developers, they need a quality portfolio of work to showcase and build their skills and this marketplace gives them the chance to do this all the while improving their work readiness skills and providing them with a small source of income.

Both our users are already trying create piecemeal solutions - our marketplace brings them together.

##3.Describe the project will you be conducting and how. your App will address the needs.
*Our Marketplace App*
We are essentially building a marketplace app that is like the *Airtasker for small web development gigs.*

This app will bring together junior developers who need industry experience and who need to build a portfolio of work, with self-employed professionals who have minor website and development needs and require a quick and reliable turnaround.

At the moment, there is very little means for these 2 users to find and work together. Our platform enables them to find and work together.

*Focus on 3 products for MVP*
To build a quality MVP, we have also decided to focus only on selling 3 'products' to begin with. The products are things which we feel our business owners need for their initial web presence and lead capture;
1. Landing page (aka website) and email
2. Simple ecommerce store
3. Create a blog site

*Unique Value Proposition*
Our UVP is that we offer business owners (our customers) peace of mind by giving them a 100% guarantee that if they don’t find someone on our site to deliver the work within 30 days, we will refund their fees in total.

The fixed fee model as well as the guarantee provide the business owner with certainty.

*Competition*
There are similar marketplace apps in Australia. Here are a few;
Theloop - a platform for all creatives showcasing their work and a job board for creative jobs
Expert360 - a marketplace for connecting businesses with consultants for major project work
Freelancer - a marketplace for all types of freelancers
Airtasker - a marketplace for general tasks (consumer to consumer mostly)

Global competitors are;
1. Upwork - Like freelancer, a marketplace for all types of freelancers
2. Fiverr - a marketplace especially for smaller web related tasks

These competitors are similar in some ways to our marketplace but none of they have narrowed and focused down to the level we have and we believe that it an advantage we have.

*App Pages and Features*
1. Dashboards for client and developer. Both dashboards showcase Open bids, In-progress projects and Completed projects
    - On client dashboard, client can view and accept bids made by developers as well as check out developer profiles and track ongoing projects
    - Developer dashboard, developer can track projects developer has made a bid on as well as track ongoing and completed projects
2. Projects homepage of all live projects including a filter based on product type (e.g. all projects which are about building a simple website)
3. Single project ID page detailing more information of each project
4. Products homepage showcasing 3 products (this information is pulled into each Project page)
5. Client and developer profile pages to populate information like personal information as well as image upload. The developer profile page also allows for showing of ratings as well as images for work portfolio. We also provide for account deletion.
6. 'Meet the Developers' page showcasing profiles of all developers
7. Ratings and reviews for each project and developers (given by the client) 
8. Ability for developers to bid on open projects and for clients to accept/decline these bids. Developers also have the ability to cancel a placed bid as long as it hasn't been accepted by a client.
9. We have provided placeholders for 'About us' and 'Terms of Service'


*Instructions on how to setup, configure and use our App*

1. Git clone to local machine from jessicaribeiroalves/devmarket repo on Github
2. CD into devmarket (folder)
3. Do a bundle install on Terminal
4. Run rails db:create on Terminal (ensure Postgres is running)
5. Run rails db:migrate on Terminal
6. Run rails db:seed on Terninal 
7. Run server (rails s) 
8. Localhost:3000 should bring up the application


*APP SCREENSHOTS*

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/jes/docs/devmarketimages/app_images/website_homepage.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/jes/docs/devmarketimages/app_images/website_project_index.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/app_images/website_devdashboard.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/app_images/website_devprofiles.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/app_images/website_project_1.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/app_images/website_edit_profile.png)


**Describe the network infrastructure the App may be based on.**
Rails has its own webserver - Puma, which was built for speed and provides a concurrent HTTP 1.1 server. 

The network infrastructure for our app will be hosted on Heroku. We deployed into Heroku using Git. We are using Heroku Postgres which is a managed SQL database.

Heroku is a cloud based Platform-as-a-Service and is fully managed looking after aspects like server configuration, network management and database versioning. The service also manages DNS.

Heroku runs our app inside a dyno (i.e. a smart Linux container) by packaging our app's code and dependencies into this container. These containers are typically run on a shared host, but are completely isolated from each other. Dynos allow for scalability.

Heroku allows for multiple languages and ensures that the language stacks are monitored, and upgraded, so it's always up-to-date.

Static and user uploaded images will be hosted on Amazon S3. Amazon S3 is a cloud storage solution. It is used widely in industry, is highly reliable, and highly scalable to meet any feature demands.

**Identify and describe the software to be used in your App.**
We are using the following software elements;
1. Server side language is Ruby on Rails
2. Database is Postgres SQL
3. Version control system is Git and Github
4. We are also using various Ruby Gems like Faker, Devise, Carrierwave, Carrierwave-AWS and MiniMagick
5. For front end development, we are using HTML, CSS and Bootstrap
6. For hosting we are using Heroku and AWS S3
7. For payment processing we are using Stripe


**Identify the database to be used in your App and provide a justification for your choice.**
We are using Postgresql for our database. Postgresql is a SQL, open source relational database which is ACID (Atomicity, Consistency, Isolation, Durability) compliant.

*Some of the possible benefits of using Postgresql over Sqlite 3*
The Rails default database is SQlite 3 and some of its disadvantages are that it has no user management and doesn't allow for further tinkering for additional performance. This database also only allows for 1 write operation at a time (so it isn't great for applications with high write volumes).

Postgresql because it's open source has a great developer community and engenders itself to strong third party support and is extensible. Postgresql is a good database especially when complex and custom procedures are needed to be undertaken.

Some of the disadvantages of Postgresql are that it may be over-kill for simple setups of read only operations (MySQL may be a better option in these instances).

**Identify and describe the production database setup (i.e. postgres instance).**
Postgres is a client/server application and as a user, we only need access to the client portions of the installation. Once installed, Postgresql allows you to create, access and destroy databases.

Each Postgresql session consists of these 3 elements;
1. A supervisory Postmaster
2. the user's psql program (front-end), and
3. 1 or more backend database servers which is the postgres process itself
 
The fundamental aspect of Postgresql are tables, which in turn are a collection of rows. Each row has the same set of named columns, and each column is of a specific type. Each row also has an unique permanent object identifier.

**Describe the architecture of your App.**
 - We are using Ruby on Rails as our web application framework. It is an open source software. Ruby on Rails is a server side language.

*Benefits of Rails*
1. It has many ready made modules and it hence efficient.
2. As it’s open source, it’s cost effective
3. It’s scaleable
   
 - For client-side code, we are using HTML and CSS
 - Rails as an in-built web server, Puma and we are hosting our application on Heroku.
 - Our database is Postgresql which is a SQL database.
 - We are using the MVC (Model View Controller) method when building this application.

**Explain the different high-level components (abstractions) in your App.**
1. The app follows the MVC pattern decomposing functions into models, controllers, and views
2. We are also using various Ruby Gems like Faker, Devise, Carrierwave, Carrierwave-AWS and MiniMagick
3. For front end styling, we are using the Bootstrap CSS library
4. More complex logic was abstracted out of the controller into service objects.

**Detail any third party services that your App will use.**
1. Our database is Postgres SQL
2. Version control is hosted with Github
3. For hosting we are using Heroku and AWS S3
4. For payment processing we are using Stripe
5. For emailing we are using Mailgun

**Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb).** 
As defined by https://www.voucherify.io, a working definition of an online marketplace *“is a virtual place where sellers and buyers meet to exchange goods or services. The exchange usually takes the form of transactions managed by the marketplace operator.”*

*Examples of two sided marketplace apps similar to our own*
1. Airtasker
2. Expert360
3. Fiverr

*Here are some key elements of  2 sided marketplace apps*

1. Sign in process, authentication and authorisation. The main marketplace apps also offer flexible authentication systems
2. Order management
3. Error handling
4. Account pages for various user types (e.g. vendor and buyer) including aspects like image uploads
5. Payment gateway e.g. Stripe, Paypal or Braintree
6. Security like SSL certificates
7. Mail alerts and notifications
8. Features like reviews, testimonials etc.

*Data Structure*
As we are using a SQL database, data is stored in tables and columns, rows. The relationship between tables and field types is called a schema. In a relational database, the schema must be clearly defined before any information can be added.

It’s important that when organising data to;
1. Maximise efficiency in queries
2. Minimize data redundancy 
3. Prevent tables from becoming out-of-sync and allow for flexibility

**Discuss the database relations to be implemented.**
In our app, we have the following ActiveRecord associations
1. Project model has 2 associations (Belongs to User model and Belongs to Product model)
2. Product model has 1 association (Has many Projects)
3. Rating model has 1 association (Belongs to Project model)
4. User model has 2 associations (Has many Projects and has many Bids). We have added a “Dependent destroy” also.
5. Image model currently is Polymorphic
6. Bid Model has 2 associations (Belongs to Project model and User model)

**Describe your project’s models in terms of the relationships (active record associations) they have with each other.**
See answer above also.

Between the six tables our models utilises several types of relationships: one to one, one to many, and polymorphic relationships. Ratings to projects is an one to one relationship. Most relationship are one to many. And polymorphic relationship was implemented for images to users but is polymorphic.

*The rationale for why we used this models and set these relationships*
1. We wanted to keep Users in 1 table and divide it according to user types (client/business and developer) as it's simpler and for both user types  - there is common fields and functions and little customisation. Keeping it as 1 table also ensures that we only need 1 user ID per project ID, whereas were we to create 2 separate tables  - then we'd need 2 user IDs per project and this adds 1 extra layer of complexity
2. We separated the Projects and Products tables  - taking into account extensibility principles as we would be looking to add more products in the future
3. We created separate tables for Ratings and Bids to allow for customisation (e.g. only client can give ratings, only developer can make bids etc.)
4. Image model currently is associated to the User model as 1 user type (developer) can upload images to their profile. We made this Image model Polymorphic also for extensibility (e.g. associating to other models like Project model), and keeping it as polymorphic also gives us more flexibility

**Provide your database schema design.**

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/ERD.png)

**Provide User stories for your App.**
We got our user story framework from atlassian (See https://www.atlassian.com/agile/project-management/user-stories)

User story: Junior Developer
1. As a junior dev, I want to be able to look for new opportunities so that I can apply for tasks/projects and get experience
2. As a junior dev I want to be able to get 2 years so that I can apply for senior roles.
3. As a junior dev I want to get lots of different experience so that I can start building my diverse portfolio.
4. As a junior dev I want to able to find side gigs to that I can earn extra income.

User story: Self-Employed Professional
1. As a self-employed professional, I want to quickly get what I want so that I can get new clients.
2. As a self-employed professional, I want to be able to work with qualified and credible people so that I don't waste time or money
3. As a self-employed professional, I want to be able to work with people I trust so that I know I will get what I want
4. As a self-employed professional, I want to be able to know how much the work is going to cost me upfront so that I can work according to my budget

**Pictures of user stories from Trello Board**

*USER STORIES*

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/user_stories.png)

**Provide Wireframes for your App.**

*MOBILE MOCKUP*

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/mobile_mockup_3.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/mobile_mockup_1.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/mobile_mockup_2.png)

*DESKTOP MOCKUP*

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/desktop_mockup.png)

**Describe the way tasks are allocated and tracked in your project.**
For project management and for task allocation, we used;
1. Trello
2. Google Calendar Power-up
3. Shared Google doc

The team communication tools we used were;
1. Slack
2. Whatsapp
 
*STEP1:Initial Planning*
Day 1 (Friday) consisted firstly of picking a name for our group (!Magicians).

This was followed by ideation and brainstorming where we as a team discussed possible ideas for a marketplace.

Brainstorming Process;
1. We initially wrote down all our ideas on a shared Google Doc
2. We then looked at similar themes coming through from these ideas and eliminated ones that we didn't like so much
3. We did also speak to an educator (Jamie) and also used his feedback to narrow down on our final idea - which is a marketplace bringing together junior developers and self employed white collar professionals.
4. We then got the idea signed off by Garett

*INITIAL PLANNING & BRAINSTORMING*

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/brainstorming.jpg)

*INITIAL PLANNING*

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/ideation_1.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/ideation_3.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/ideation_4.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/ideation_5.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/ideation_6.png)

After brainstorming, also on Day 1, we did create a Trello board to add in all relevant tasks associated with the project including the following Trello boards;
1. User stories
2. Tasks to do
3. Tasks in-progress
4. Tasks completed
5. Backlog
6. Additional features (wishlist items)
7. User work-flow
8. Assessment Rubric

*TRELLO BOARD PLANNING*

![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/trello_1.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/trello_2.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/trello_colourpalette.png)
![alt text](https://raw.githubusercontent.com/natashamunasinghe/devmarket/master/docs/devmarketimages/colourpalette.png)

*STEP 2: Wireframing and ERDs*
On Day 2 (Monday), after we had added the initial tasks onto Trello, we created the ERDs and discussed the key database relations. We drew the ERDs out.

We then used Balsamiq to wireframe the marketplace. We took a mobile first approach and then wireframed the end-end-to process. We also wireframed for laptop devices.


*STEP 3: Beginning to Code*
Our target was to completely finish wireframing, user work flow and ideation by end of Day 2 and be ready to start the coding process on Day 3 (Tuesday).

These are some of the key planning steps we following before we started to code;
1. One of our team created a Repo on Github and the other 2 team members forked this repo and cloned into our local machines
2. Once we had created the models on our Rails app, we also then deployed to Heroku to ensure that the first version was working
3. We then assigned a different part of the app to each team member and started programming, with multiple check-ins

**Discuss how Agile methodology is being implemented in your project.**
*Stand-ups*
We checked-in with each other constantly throughout the day during and after we had committed and deployed to Github as well as when we were programming. We did go to each other for help and support and we kept an open form of communication.

We did manage to have a few morning stand up meetings where we'd discuss the tasks for the day as well as discuss any challenges we were encountering.

As an example of the types of things we'd discuss, here are a few items;
1. Discussion and agreement on naming conventions
2. Discussion and agreement on commenting

*Re-iterations*
We did have to change certain functionalities and work flows of the application from time-to-time. We'd as a team discuss these iterations and move forward once we were all in agreement. There were slight changes to the MVP depending on these iterations.

*Pair programming*
When programming the ERDs, we also did use pair programming principles.

**Provide an overview and description of your Source control process.**
The source control platform we used was Git and Github.

*Our process*
1. We agreed to try to individually commit to Github at least twice a day during this project
2. One team member created the Master repo, whilst the other 2 team members forked and cloned this to our local machines.
3. We also agreed that each team member who didn't own the Master repo would first commit to a branch, then merge their own master with that branch and then finally merge with the Master repo.
4. We would discuss each merge conflict as and when they emerged


***Provide an overview and description of your Testing process.***
We went through the site 1-by-1 to find bugs in our code and then we went through the site together as a team from beginning to end to identify errors.

Here is a  checklist of manual integrations tests we have identified.
***Users from the public***
1. Can see Home page, Product offerings, Project Index, Developer Profiles
2. Can not post a project (client) or bid (dev)
3. Can register as a new user (client or dev)
4. Can not see Project Show, or any dashboards

***Developers logged in***
1. Can see Project Show page
2. Can place ONE bid on any open project
3. Can view their developer dashboard
4. Can cancelled a pending bid
5. Can edit their profile
    1. Check invalid data is not being saved and user redirected (model validations)
6. Can upload an avatar to their profile
7. Can upload and remove images to their profile


***Clients logged in***
1. Can see Project Show page
2. Can post a project
   1. Check invalid data is not being saved and user redirected (model validations)
3. Can view their client dashboard
4. Can cancel an open project
5. Can accept ONE bid on THEIR 'open' projects
6. Can complete THEIR 'ongoing' projects
7. Can rate the project/dev only once the project is complete
    1. Check invalid data is not being saved and user redirected (model validations)
8. Can not add incomplete information to create project (and ensure Stripe doesn’t charge for this)
    1. Check invalid data is not being saved and user redirected (model validations)

**Discuss and analyse requirements related to information system security.**
*Common threats to web applications*
1. User account hijacking
2. Bypass of access control
3. Reading or modifying sensitive data, or
4. Presenting fraudulent content. 

Sessions are particularly vulnerable to security breaches and this is one the reasons that sensitive data should not be stored in sessions. We can also as a preventative security measure, auto expire sessions in a database table.

Rails has built-in security features that come with the framework including helper methods which prevent SQL injections. Another common attack vectors of web sites are forms. 
As of Rails 5.2 encrypted cookies and sessions are protected using AES GCM encryption.

Sensitive password is always encrypted before being saved in the database.

Credit card information is never stored on our application. Sensitive payment details is handled by the Stripe service.

**Discuss methods you will use to protect information and data.**
1. We used Rails form helper methods to protect against CSRF (Cross Site Request Forgery) attacks with authenticity tokens. 
2. For user inputs our controllers explicitly check the parameters attributes and our models validate the data before they are saved into the database.
3. The Devise gem we are using is built on top of Warden which is a separate module and executes before the Rails application is invoked. Warden provides cookie handling, verifies the logged in user and allows for restricted access. BCrypt encrypts passwords our database.
4. Credit card information is never stored on our application. Sensitive payment details is handled by the Stripe service.

**Research what your legal obligations are in relation to handling user data.**
The Privacy Act 1988 defines what *personal information* is e.g. individual’s name, telephone etc. This Act has 13 Australian Privacy Principles (APPs). We need to abide by these APPs in the collection and storage of personal information by our app.
Were this app to grow (over $3million in revenue), in the event  of a privacy breach of personal information, we also are subject to the Notifiable Data Breaches Scheme

Stripe our third party payment processing system also has it owns Privacy Policy and all complaints in Australia for Stripe users have to be heard by Office of the Australian Information Commissioner
