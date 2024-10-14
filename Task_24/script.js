$(document).ready(function(){	
	$('#check-btn').click(function(){
        	let firstName=$('#firstname').val();
		let email=$('#email').val();
		if(email &&  firstName){
			alert("haii");
			$.ajax({	
				url:'./Components/checkEmail.cfc?method=checkEmail',
				type:'POST',
				data:{firstname:firstName,email:email},
				success:function(!response){
						if(response.trim()==="false"){
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
});