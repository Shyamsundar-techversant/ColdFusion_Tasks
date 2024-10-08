	//Prevent resubmit on refresh and back button
	if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}
	let image=document.getElementById('img');
	let imgError=document.getElementById('imgError');
	function validateImg(){
		let img=image.value;
		let file=image.files[0];
		const maxSize=1*1024*1024;
		let allowedExtensions=/(\.jpg|\.png|\.gif)$/i;
		if(!image.files || image.files.length===0){
			imgError.innerHTML="*Please upload your image";
			return false;
		}
		else if(!allowedExtensions.exec(img)){
			imgError.innerHTML="*Only jpg, jpeg, png, gif formats are supported";
			img='';	
			return false;
		}
		else if(file.size>maxSize){
			imgError.innerHTML="*Image size can not exceed more than 2MB";
			img='';
			return false;
		}
		else{
			imgError.innerHTML="";
			return true;
		}
	}

	function validateForm(event){
		if(!validateImg()){
			event.preventDefault();
		}
	}





