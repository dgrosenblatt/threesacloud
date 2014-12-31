threesacloud
============

[![Build Status](https://travis-ci.org/dgrosenblatt/threesacloud.svg?branch=master)](https://travis-ci.org/dgrosenblatt/threesacloud) [![Coverage Status](https://coveralls.io/repos/dgrosenblatt/threesacloud/badge.png)](https://coveralls.io/r/dgrosenblatt/threesacloud) [![Code Climate](https://codeclimate.com/github/dgrosenblatt/threesacloud/badges/gpa.svg)](https://codeclimate.com/github/dgrosenblatt/threesacloud)


Concept:

To review the weather of a certain day in a location selected by the user. This will then be shared with other users and voted up/down based upon the hilarity of the review comment.

Basic User Stories:

As an unregistered user
I would like to be able to create an account
So that I can review the weather and share it with everyone

	Acceptance Criteria
		[] access a new user form -> using Devise supplied forms
		[] From the supplied form I should have to enter: email, username, avatar
		[] I will have to click on 'Submit' to submit the form
		[] if info supplied does not meet standards, error messages will display on the form

As a registered user
I would like to be able to enter my location/date and view the weather
So that I can add a review for the local weather

	Acceptance Criteria
		[] From the main page be able to enter a city to see the current weather (defaults to today's date)
		[] From the main page be able to enter a date to see the weather from another day
		[] Out of format cities will generate errors which will be displayed

As a registered user
I would like to be able to rate the weather
So that other users can see what I think of the weather in that location

	Acceptance Criteria
		[] I should be able to access a review form to add my review
		[] I should have to enter in the weather conditions (how hot, and precipitation)
		[] I should be able to rate the weather 1-5
		[] I would like to be able to add an emoji (time permitting)
		[] Optionally I would like to be able to add a description

As a registered user
I would like to be able to see all the reviews for a location
So that I can vote up/down other user's reviews

	Acceptance Criteria
		[] I should be able to select a location
		[] I should be able to view all the submitted reviews for a selected location on a given date
		[] I should be ale to sort the reviews by up/down vote numbers

As a registered user
I would like to be able to see the most popular up voted comments on the main page
So that I can see what other parts of the country are experiencing

	Acceptance Criteria
		[] I should be able to see the most popular comments on the main page without prompting

If you want to run a single test instead of the entire test suite, add ' ,focus: true' before the do for each scenario.

