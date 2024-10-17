$(document).ready(function(){	
	$('#check-btn').click(function(){
		let email=$('#email').val();
		alert(email);
		if(email){
				$.ajax({
					url: './Components/checkEmail.cfc?method=emailCheck',
					type:'POST',
					data: {email:email },
					dataType:'json',
					success: function(response){
							console.log(response);
							if(response === "Exists"){
								alert('Mail Id already Exists');
								$('#submit-btn').prop('disabled',true);
							}
							else if(response ==="NotExists"){
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