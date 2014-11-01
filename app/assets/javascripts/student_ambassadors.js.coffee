ready = ->
	
	$("#new_student_ambassador").bootstrapValidator
	  excluded: [
	    ":disabled"
	    ":hidden"
	    ":not(:visible)"
	  ]
	  feedbackIcons:
	    valid: "glyphicon glyphicon-ok"
	    invalid: "glyphicon glyphicon-remove"
	    validating: "glyphicon glyphicon-refresh"

	  live: "enabled"
	  message: "This value is not valid"
	  submitButtons: "input[type=\"submit\"]"
	  trigger: null
	  fields:
	    "student_ambassador[name]":
	      validators:
	        notEmpty:
	          message: "The name is required"
			  
	    "student_ambassador[branch]":
	      validators:
	        notEmpty:
	          message: "The branch is required"
			  
	    "student_ambassador[year]":
	      validators:
	        notEmpty:
	          message: "The year is required"
			  
	    "student_ambassador[college]":
	      validators:
	        notEmpty:
	          message: "The college is required"
			  
	    "student_ambassador[mobile]":
	      validators:
	        notEmpty:
	          message: "The mobile number is required"
	        digits:
	          message: "The mobile number can contain digits only"
	        stringLength:
	          min: 10
	          max: 10
	          message: "Please enter a valid 10 digit mobile number"
		  
#
# $(document).ready(ready)
# $(document).on('page:load', ready)