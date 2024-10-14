$(document).ready(function() {
	
	$('#checkEmailBtn').on('click', function(event) {

	event.preventDefault();
        var email = $('#email').val();

	const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
        
       	if(emailPattern.test(email)){
        	$.ajax({
			url: './checkEmail.cfc?method=checkmail',
            		type: 'POST',
            		data: { email: email },
            		success: function(response) {
				console.log(response)
			 
				if (response.trim() == '\"exists\"')
				{
					alert('Mail ID is already existing');
                    			$('#submitBtn').prop('disabled', true);
                		} else {
                    			$('#submitBtn').prop('disabled', false);
                		}
            		}
            	
		
        	});
	}
	else{
		alert("Enter a valid email address")
	}
    });
}); 











