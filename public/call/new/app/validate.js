$(document).ready(function(){
	window.Parsley.addValidator('zipcode', {
		requirementType: 'string',
		validateString: function(value) {
		  console.log('received value ' + value + ' to validate as ZIP');
			return value.length == 5  && parseInt(value);
		},
		messages: {
			en: 'Please enter a valid ZIP code.'
		}
	});
	window.Parsley.addValidator('phone', {
	  requirementType: 'string',
	  validateString: function(value) {
		  console.log('received value ' + value + ' to validate as phone');
	    value = value.replace(/[^0-9]/g, '')
			if (value.substring(0, 1) != '1') value = '1' + value;
			if (value.length == 11) return value;
			return false;
	  },
	  messages: {
	    en: 'Please enter a valid phone number.'
	  }
	});
	form = $('form#caller_data');
	$(form).on('submit', function(e) {
		e.preventDefault();
		console.log('Default prevented.');
	});
	var parsley_instance = $(form).parsley();

	parsley_instance
	.on('form:success',function() {
	  console.log('Form validated.');
		$(form)
		.osdi({
			endpoint: 'https://actionnetwork.org/api/v2/forms/773c08ec-e3b6-4596-878d-3653b39a3d3c/submissions',
			immediate: true,
			done: function(data, status) {
				console.log('Got status ' + status);
				console.log(data);
			},
			fail : function(jqXHR, textStatus, errorThrown) {
				console.log('Error ' + errorThrown + ' ' + text_status);
				console.log(jqXHR);
			}
		});
	})
	.on('form:error',function(){
	  console.log('Validation errors: form not submitted.');
	});
});
