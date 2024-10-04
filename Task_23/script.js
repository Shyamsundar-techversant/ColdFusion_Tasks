	//Prevent resubmit on refresh and back button
	if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}

	let appliedPosition=document.getElementById("position");
	let relocate=document.querySelector('input[name="relocate"]:checked');
	let joinDate=document.getElementById("join-date");
	let portfolio=document.getElementById("portfolio");
	let resume=document.getElementById("resume");
	let salary=document.getElementById("salary");
	let firstName=document.getElementById("firstname");
	let lastName=document.getElementById("lastname");
	let email=document.getElementById("email");
	let phone=document.getElementById("phone");

	//Errors
	let posError=document.getElementById("position-error");
	let relocateError=document.getElementById("relocate");
	let joinDateError=document.getElementById("join-date-error");
	let portfolioError=document.getElementById("portfolio-error");
	let resumeError=document.getElementById("resume-error");
	let salaryError=document.getElementById("salary-error");
	let fnameError=document.getElementById("firstname-error");
	let lnameError=document.getElementById("lastname-error");
	

	//Validate Form Empty fields and Input Patterns

	function validatePosition(){
		if(appliedPosition.value.length===0){
			posError.innerHTML="Please Enter your interested job position";
			return false;
		}
		else{
			posError.innerHTML="";
			return true;
		}

	}
	
	function relocateError(){
		let yesToRelocate=document.getElementById("Yes");
		let noToRelocate=document.getElementById("No");
		if(yesToRelocate.checked){
			relocateError.innerHTML="";
			return true;
		}
		else if(noToRelocate.checked){
			relocateError.innerHTML="";
			return true;
		}
		else{
			relocateError.innerHTML="This field is required";
			return false;
		}
	}
	
	function validateJoinDate(){
		let date = joinDate.split('-').reverse().join('-');
		if(joinDate.length===0){
			joinDateError.innerHTML="Please Enter Your Date Of Birth";
			return false;
		}	
		else if(!date.match(/^(0[1-9]|[1-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-\d{4}$/)){
			joinDateError.innerHTML="Please Enter a valid date";
			return false;
		}
		else{
			joinDateError.innerHTML="";
			return true;
		}
	}
	
	function validatePortfolio(){
		const urlPattern = /^(https?:\/\/)?(www\.)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(\/\S*)?$/;
		let websiteInput=portfolio.value;
		if(urlPattern.test(websiteInput)){
			portfolioError.innerHTML="";
			return true;
		}
		else{
			portfolioError.innerHTML="Please Enter a Valid Website";
			return false;
		}
	}

	function validateResume(){
		let resumeFile=resume.value;
		let file=resume.files[0];
		const allowedExtensions = /(\.pdf|\.doc|\.docx)$/i;
		if(!resume.files||resume.files.length===0){
			resumeError.innerHTML="Please Upload your resume";
			return fasle;
		}
		else if(!allowedExtensions.exec(resumeFile)){
			resumeError.innerHTML="Only .pdf,.doc,.docx formats are supported";
			return false;	
		}
		else{
			resumeError.innerHTML="";
			return true;
		}
	}

	function validateSalary(){
		const salaryPattern = /^[1-9]\d*(\.\d+)?$/;
		let salaryValue=salary.value;
		if(salaryValue.length===0){
			salaryError.innerHTML="Enter your expected salary ";
			return false;
		}
		else if(salaryPattern.test(salaryValue)){
			salaryError.innerHTML="Enter a valid Salary";
			return false;
		}
		else{
			salaryError.innerHTML="";
			return true;
		}
	}

	function validateFirstName(){
		let fname=firstName.value;
		if(fname.length===0){
			fnameError.innerHTML="Please enter your firstname";
			return false;
		}
		else if(!fname.value.match(/^[A-Za-z]+(\s[A-Za-z]+)?$/)){
			fnameError.innerHTML="Please enter a valid firstname";
			return false;
		}
		else{
			fnameError.innerHTML="";
			return true;
		}
	}

	function validateLname(){
		let lname=lastName.value;
		if(lname.length===0){
			lnameError.innerHTML="Please enter your lastname";
			return false;
		}
		else if(!lname.value.match(/^[A-Za-z]+(\s[A-Za-z]+)?$/)){
			lnameError.innerHTML="Please entery a valid lastname";
			return false;
		}
		else{
			lnameError.innerHTML="";
			return true;
		}
	}
	




	 