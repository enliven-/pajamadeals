# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	
	# Form validations
	
	$("#edit_user").bootstrapValidator
	  feedbackIcons:
	    valid: "glyphicon glyphicon-ok"
	    invalid: "glyphicon glyphicon-remove"
	    validating: "glyphicon glyphicon-refresh"

	  live: "enabled"
	  message: "This value is not valid"
	  trigger: null
	  fields:
	    "user[name]":
	      validators:
	        notEmpty:
	          message: "The name is required"

	    "user[mobile]":
	      validators:
	        notEmpty:
	          message: "The mobile number is required"
	        digits:
	          message: "The mobile number can contain digits only"
	        stringLength:
	          min: 10
	          max: 10
	          message: "Please enter a valid 10 digit mobile number"

	    "user[email]":
	      validators:
	        emailAddress:
	          message: "The input is not a valid email address"

	    # "user[college_id]":
 # 	      validators:
 # 	        notEmpty:
 # 	          message: "The college is required"
	

$(document).ready(ready)
$(document).on('page:load', ready)