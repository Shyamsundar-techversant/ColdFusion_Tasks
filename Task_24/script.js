$(document).ready(function(){	
	$('#check-btn').click(function(){
		let email=$('#email').val();
		if(email){
				$.ajax({
					url: 'Components/checkEmail.cfc?method=checkEmail',
					type:'POST',
					data: {email:email },
					dataType:'json',
					success: function(response){
							alert(response);
							if(response.trim()==="Exists"){
								alert('Mail Id already Exists');
								$('#submit-btn').prop('disabled',true);
							}
							else if(response.trim()==="NotExists"){
								$('#submit-btn').prop('disabled',false);
							}		
					}
				});		
		}
		else{
			alert("Please enter an email Id");
		}
		return false;			
	});
});