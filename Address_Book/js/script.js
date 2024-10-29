$(document).ready(function(){
	if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}
	
	let	title=$('#title'),
		firstname=$('#firstname'),
		lastname=$('#lastname'),	
		gender=$('#gender'),
		dob=$('#dob'),
		email=$('#email'),
		phone=$('#phone'),
		photo = document.getElementById('upload-img').files[0],
		address=$('#address'),
		street=$('#street'),
		pincode=$('#pincode');
	//ADD	    	
	$('#add-contact-btn').on('click',function(event){
		event.preventDefault();
		console.log(title.val());
		$.ajax({
			
			url:'Components/main.cfc?method=validateContactForm',			
			type:'POST',
			data:{
				title:title.val(),
				firstname:firstname.val(),
				lastname:lastname.val(),
				gender:gender.val(),
				dob:dob.val(),
				uploadImg:photo,
				email:email.val(),
				phone:phone.val(),
				address:address.val(),
				street:street.val(),
				pincode:pincode.val()
			},
			contentType:false,
			processData:false,
			success:function(response){

			},
			error:function(){

			}
		});
	});
});
