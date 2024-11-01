$(document).ready(function(){
	if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}
	let contactId;
	let	contTitle=$('#title'),
		contFirstname=$('#firstname'),
		contLastname=$('#lastname'),
		contGender=$('#gender'),
		contDob=$('#dob'),
		contImg=$('#upload-img'),
		contEmail=$('#email'),
		contPhone=$('#phone'),
		contAddress=$('#address'),
		contPincode=$('#pincode'),
		contStreet=$('#street');
	


	let	fullName=$('#contact-name'),
		gender=$('#contact-gender'),
		dob=$('#contact-dob'),
		address=$('#contact-address'),
		pincode=$('#contact-pincode'),
		email=$('#contact-email'),
		phone=$('#contact-phone');

	//ADD
	$('#create-cont').on('click',function(){
		$('#contacts-form').trigger('reset');
		document.getElementById('add-cont').style.display="block";
		document.getElementById('edit-cont').style.display="none";
	})

	
	//VIEW
		
    	$('.contact-view-btn').on('click', function() {
		// Get the contact ID from data-id attribute
		contactId = $(this).data('id');
		$.ajax({
			url:'Components/main.cfc?method=getContactById',
			type:'POST',
			data:{
				id:contactId
			},
			success:function(response){
				const data=JSON.parse(response);
				console.log(data);
				const dataRow = data.DATA[0];
				$('#profile-picture').attr('src',`./Uploads/${dataRow[7]}`);
				fullName.text(`${dataRow[13]}${dataRow[3]}${dataRow[4]}`);
				gender.text(`${dataRow[14]}`);
				dob.text(`${dataRow[6]}`);
				address.text(`${dataRow[8]}`);
				pincode.text(`${dataRow[10]}`);
				email.text(`${dataRow[11]}`);
				phone.text(`${dataRow[12]}`);		
			},
			error:function(){
				console.log("Request Failed");
			}
		});
	});

	//EDIT
	$('.edit-cont-details').on('click',function(){
		document.getElementById('add-cont').style.display="none";
		document.getElementById('edit-cont').style.display="block";
		contactId=$(this).data('id');
		console.log(contactId);
		let fileName;	
		$.ajax({
			url:'Components/main.cfc?method=getContactById',
			type:'POST',
			data:{
				id:contactId
			},
			success:function(response){
				const data=JSON.parse(response);
				const dataRow = data.DATA[0];
				console.log(data);	
				contTitle.val(dataRow[2]);
				contFirstname.val(dataRow[3]);
				contLastname.val(dataRow[4]);
				contGender.val(dataRow[1]);
				contDob.val(dataRow[6]);
				contEmail.val(dataRow[11]);
				contPhone.val(dataRow[12]);
				contAddress.val(dataRow[8]);
				contPincode.val(dataRow[10]);
				contStreet.val(dataRow[9]);	
			},
			error:function(){
				console.log("Request Failed");
			}
		});		
	});

	$('#edit-cont').on('click',function(event){	
		let fileName=contImg.prop('files')[0]?.name;
			if(fileName){
				console.log("file",fileName);
			}
			else{
				console.log("No file selected");
			}
			console.log("id",contactId);	
			console.log("title",contTitle.val());
			console.log("firstname",contFirstname.val());
			console.log("lastname",contLastname.val());
			console.log("gender",contGender.val());
			console.log("dob",contDob.val());
			console.log("imagePath",fileName);
			console.log("email",contEmail.val());
			console.log("phone",contPhone.val());
			console.log("address",contAddress.val());
			console.log("street",contStreet.val());
			console.log("pincode",contPincode.val());
		$.ajax({
			url:'Components/main.cfc?method=validateContactForm',
			type:'POST',
			data:{
				contId:contactId,
				title:contTitle.val(),
				firstname:contFirstname.val(),
				lastname:contLastname.val(),
				gender:contGender.val(),
				dob:contDob.val(),
				uploadImg:fileName,
				email:contEmail.val(),
				phone:contPhone.val(),
				address:contAddress.val(),
				street:contStreet.val(),
				pincode:contPincode.val()
			},
			success:function(response){					
				if(!response){
					event.preventDefault();
				}
				else{
					alert("Contact Updated Successfully");
				}
			},
			error:function(){
				event.preventDefault();
				console.log("Request Failed");
			}
		});

	});

});








