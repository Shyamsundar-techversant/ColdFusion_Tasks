/*
let delteButton=document.getElementById("delete-button");
let deletePage=document.getElementById("deletePage");
let overlay=document.getElementById("overlay");
let pageId;
function displayDeletePage(id){
	pageId=id;
	console.log(pageId);
	deletePage.style.display="block";
	overlay.style.display="block";
}

function closeDeletePage(){
	deletePage.style.display="none";
	overlay.style.display="none";
}
*/
$(document).ready(function() {
	let pageId;

	// Use event delegation to handle dynamically created elements
	$(document).on('click', '.delete-button', function() {
		pageId = $(this).data('id');
		$('#deletePage').show();
		$('#overlay').show();
	});
	$('.close-page').on('click',function(){
		$('#deletePage').hide();
		$('#overlay').hide();		
	});
	$('.delete-btn').on('click',function(){
		$.ajax({
			url:'Components/task_28.cfc?method=deletePage',
			type:'POST',
			data:{
				pageid:pageId
			},
			success:function(response){
				let data=JSON.parse(response);
				if( data === "Success"){					
					$('button.delete-button[data-id="' + pageId + '"]').closest('tr').remove();
					alert("Page deleted successfully");
				}
				else{
					console.log("error;;");
				}
				
			},
			error:function(){
				console.log("Request failed");
			}
		});
		$('#deletePage').hide();
		$('#overlay').hide();		
	});
});
