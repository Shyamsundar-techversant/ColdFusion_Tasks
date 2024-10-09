$(document).ready(function(){
	
	$('#check-email').click(function(){
		let email=$('#email').val();
		if(email){
			$.ajax({	
				url:'checkEmail.cfc',
				type:'POST',
				data:{email:email},
				dataType:json,
				success:function(response){
						if(response.exists){
							$('#email-error').text('Mail Id already Exists');
							$('#submit-btn').prop('disabled',true);
						}
						else{
							$('#email-error').text('');
							$('#submit-btn').prop('disabled',false);
						}	
				},
				error:function(){
					alert("An Error Occured");
				}	
			});
		}
		else{
			alert("Please enter an email Id");
		}		
	});
})

