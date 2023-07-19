//Get Date/Time

//Use: Add an output variable for date_time to grab the current date and time for the custon action
//ex: August 5th 08:00:00 PM

(function execute(inputs, outputs) {

  	outputs.date_time = new GlideDateTime();
  
})(inputs, outputs);
