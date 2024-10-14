$(document).ready(function(){	
	$('#check-btn').click(function(){
		let email=$('#email').val();
		if(email){
			$.ajax({
					type: 'post',
					dataType: 'json',
					url: 'Components/checkEmail.cfc',
					data: {method: 'checkEmail', email: $('#email').val() },
					success: function(data){
	
					}
				});		
		}
		else{
			alert("Please enter an email Id");
		}
		return false;			
	});
});