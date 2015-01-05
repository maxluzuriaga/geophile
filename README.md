GeoPhile
=====================

My HackPrinceton 2014 submission which I worked on with [Aqeel Phillips (Princeton '17)](https://github.com/aqeelphillips). We wrote an app for Android and web (using Ruby on Rails) that allows event organizers to post exclusive location-based content for their event's attendees.

This repository is for the web app, which is used by organizers to create events and post text updates and files to it. The files are uploaded through Google Drive, so the app uses both the Google authentication API and the Google Drive API to let end users access the files that organizers upload. The organizers set a location and a time for their event, so that only users in that particularl location during that time can access the content they post.

Users in that place at that time access that content using a separate Android app, which looks around for events in the areas.

Screenshots of the app in action, as well as more information, can be found [on ChallengePost](http://challengepost.com/software/geophile).
