# The Odin Project Flight Booker

[project link](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/flight-booker)

This assignment created a flight booking app/site, focusing on building more advanced forms in Rails (select/dropdown) and nested attributes/forms.  User selects a flight based on certain filters (date, dep/arrival airports) and specifies number of passengers. After selecting from available flights, a new booking form collects passenger info and creates a new booking.  

ActionMailer was utilized to send out booking confirmation emails if user provides a valid email address.  TOP suggested using SendGrid for email, but I simply chose to set up a dummy gmail account and use that.  

There was a bit more complex routing as well (search/results on same page).  After feeling more comfortable with forms, also added a search feature for searching for a specific booking (Flight numbers and booking confirmation numbers are simply their database id's).

Also incorporated Tailwind CSS for styling and added additional images/text to create a more complete looking site.  

Learnings
- setting up form inputs and fields to create / add to params hash that is passed to next controller / view
- seeting up ActionMailer to send out emails (using gmail)
- creating a nested route to search bookings and creating a custom controller method
- resetting/seeding databases with initial data (for flights)
- working with dates/times is not easy (Rails reconfigures Time objects and needs some manipulation in config/application.rb to get times to appear right)  
- time spent thinking about and setting up models/associations **beforehand** is critical; figuring out how to properly set model associations can be harder than it seems
- more practice setting up helper query methods inside models
- more practice setting up queries inside controller methods