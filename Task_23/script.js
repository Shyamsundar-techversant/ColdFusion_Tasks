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
	let phone=document.getElementById("mob");

	//Errors
	let posError=document.getElementById("position-error");
	let relocationError=document.getElementById("relocate-error");
	let joinDateError=document.getElementById("join-date-error");
	let portfolioError=document.getElementById("portfolio-error");
	let resumeError=document.getElementById("resume-error");
	let salaryError=document.getElementById("salary-error");
	let fnameError=document.getElementById("firstname-error");
	let lnameError=document.getElementById("lastname-error");
	let emailError=document.getElementById("email-error");
        let phoneError=document.getElementById("phone-error");
        let submitError=document.getElementById("submit-error");
	//Validate Form Empty fields and Input Patterns

	function validatePosition(){
		if(appliedPosition.value.length===0){
			posError.innerHTML="*Please Enter your interested job position";
			return false;
		}
		else{
			posError.innerHTML="";
			return true;
		}

	}
	
	function validateRelocation(){
		let yesToRelocate=document.getElementById("yes-relocate");
		let noToRelocate=document.getElementById("no-relocate");
		if(yesToRelocate.checked){
			relocationError.innerHTML="";
			return true;
		}
		else if(noToRelocate.checked){
			relocationError.innerHTML="";
			return true;
		}
		else{
			relocationError.innerHTML="*This field is required";
			return false;
		}
	}
	
	function validateJoinDate(){
		let date = joinDate.value.split('-').reverse().join('-');
		if(joinDate.value.length===0){
			joinDateError.innerHTML="*Please Enter Your Date Of Birth";
			return false;
		}	
		else if(!date.match(/^(0[1-9]|[1-2][0-9]|3[0-1])-(0[1-9]|1[0-2])-\d{4}$/)){
			joinDateError.innerHTML="*Please Enter a valid date";
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
        if(portfolio.value.length===0){
            portfolioError.innerHTML="*Please enter your website link";
        }
		else if(urlPattern.test(websiteInput)){
			portfolioError.innerHTML="";
			return true;
		}
		else{
			portfolioError.innerHTML="*Please Enter a Valid Website";
			return false;
		}
	}

	function validateResume(){
		let resumeFile=resume.value;
		let file=resume.files[0];
		const allowedExtensions = /(\.pdf|\.doc|\.docx)$/i;
		if(!resume.files||resume.files.length===0){
			resumeError.innerHTML="*Please Upload your resume";
			return false;
		}
		else if(!allowedExtensions.exec(resumeFile)){
			resumeError.innerHTML="*Only .pdf,.doc,.docx formats are supported";
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
			salaryError.innerHTML="*Enter your expected salary ";
			return false;
		}
		else if(!salaryPattern.test(salaryValue)){
			salaryError.innerHTML="*Enter a valid Salary";
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
			fnameError.innerHTML="*Please enter your firstname";
			return false;
		}
		else if(!fname.match(/^[A-Za-z]+(\s[A-Za-z]+)?$/)){
			fnameError.innerHTML="*Please enter a valid firstname";
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
			lnameError.innerHTML="*Please enter your lastname";
			return false;
		}
		else if(!lname.match(/^[A-Za-z]+(\s[A-Za-z]+)?$/)){
			lnameError.innerHTML="*Please entery a valid lastname";
			return false;
		}
		else{
			lnameError.innerHTML="";
			return true;
		}
	}
	
    function validateEmail(){
        if(email.value.length===0){
            emailError.innerHTML="*Please Enter your email";
            return false;
        }
        else if(!email.value.match(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)){
            emailError.innerHTML="*Please enter a valid email";
            return false;
        }
        else{
            emailError.innerHTML="";
            return true;
        }
    }

    function validatePhone(){
        if(phone.value.length===0){
            phoneError.innerHTML="*Please Enter your phone number";
            return false;
        }
        else if(!phone.value.match(/^[6-9]\d{9}$/)){
            phoneError.innerHTML="*Please enter a valid phone number";
            return false;
        }
        else{
            phoneError.innerHTML="";
            return true;
        }
    }

    //Validate Form
    function validateForm(event){
        
        if(!validatePosition()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validateRelocation()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validateJoinDate()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validatePortfolio()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validateResume()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validateSalary()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validateFirstName()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validateLname()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validateEmail()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        if(!validatePhone()){
            event.preventDefault();
            submitError.innerHTML="*Complete the form";
        }
        setTimeout(()=>{
            submitError.innerHTML="";
        },5000);
    }


	 