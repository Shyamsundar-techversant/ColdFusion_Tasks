	//Prevent resubmit on refresh and back button
	if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}
	let num=document.getElementById('value');
	let form=document.getElementById('numForm');
	let error=document.getElementById('validation-error');	
	form.addEventListener('submit',(event)=>{
		let number=num.value;
		error.innerHTML='';
		if(!number){
			error.innerHTML="Please Enter the input";
			event.preventDefault();
		}
		else if(isNaN(number)){
			error.innerHTML="Value must be a number";
			event.preventDefault();
		}
		setTimeout(()=>{
			error.innerHTML="";
		},3000);
	});