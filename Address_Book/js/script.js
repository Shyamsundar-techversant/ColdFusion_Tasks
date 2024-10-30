$(document).ready(function(){
	if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}
	let contactId;
    	$('.contact-view-btn').on('click', function() {
		// Get the contact ID from data-id attribute
		contactId = $(this).data('id');
		console.log(contactId); // Display or use the ID as needed
		$.ajax({
			url:'Components/main.cfc?method=getContactById',
			type:'POST',
			data:{
				id:contactId
			},
			success:function(response){
				let data =response.json();
				console.log(data);
			},
			error:function(){
				console.log("Request Failed");
			}
		});
	});
});
