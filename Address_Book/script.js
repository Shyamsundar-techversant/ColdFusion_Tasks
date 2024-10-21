//Prevent resubmit on refresh and back button
	if(window.history.replaceState){
		window.history.replaceState(null,null,window.location.href);
	}

let logIn=document.getElementById('logIn');
let signUp=document.getElementById('signUp');
let fullName=document.getElementById('fullname');
let email = document.getElementById('email');
let username = document.getElementById('username');
let password = document.getElementById('password');
let confirmPassword = document.getElementById('conf-password');
let formHead=document.getElementById('formHead');

//Errors
let fnameError=document.getElementById('fname-error');
let emailError=document.getElementById('email-error');
let usernameError=document.getElementById('username-error');
let passwordError=document.getElementById('password-error');
let confirmError=document.getElementById('confirm-error');
let formError=document.getElementById('form-error');
let validationError=document.getElementById('validation-error');

function validateFname(){
	if(fullName.value.length===0){
		fnameError.textContent="*Please enter your first name";
		return false;
	}
	else if(!fullName.value.match(/^[A-Za-z]+(\s[A-Za-z]+)?$/)){
		fnameError.textContent="*Please enter a valid firstname";
		return false;
	}
	else{
		fnameError.textContent="";
		return true;
	}
}
function validateEmail(){
	if(email.value.length===0){
		emailError.textContent="*Please enter your email";
		return false;
	}
	else if(!email.value.match(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)){
		emailError.textContent="*Please enter a valid email";
		return false;
	}
	else{
		emailError.textContent="";
		return true;
	}
}
function validateUserName(){
	const usernamePattern = /^[a-zA-Z_][a-zA-Z0-9_]{4,14}$/;
	if(username.value.length===0){
		usernameError.textContent="*Please enter your username";
		return false;
	}
	else if(!username.value.match(usernamePattern)){
		usernameError.textContent="*Please enter a valid username";
		return false;
	}
	else{
		usernameError.textContent="";
		return true;
	}
}
function validatePassword(){
	if(password.value.length===0){
		passwordError.textContent="*Please enter your password";
		return false;
	}
	else if(!password.value.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/)){
		passwordError.textContent="*Please enter a valid password";
		return false;
	}
	else{
		passwordError.textContent="";
		return true;
	}
}
function validateConfPass(){
	let passwordOrg=password.value;
	let confPass=confirmPassword.value;
	if(confPass.length===0){
		confirmError.textContent="*This field is required";
		return false;
	}
	else if(confPass===passwordOrg){
		confirmError.textContent=" ";
		return true;
	}
	else{
		confirmError.textContent="*Password doesn't match with the original";
		return false;
	}
}

function submitForm(){
	if(!validateFname()){
		event.preventDefault();
		validationError.textContent="Complete the form";
	}
	if(!validateEmail()){
		event.preventDefault();
		validationError.textContent="Complete the form";		
	}
	if(!validateUserName()){
		event.preventDefault();
		validationError.textContent="Complete the form";
	}
	if(!validatePassword()){
		event.preventDefault();
		validationError.textContent="Complete the form";
	}
	if(!validateConfPass()){
		event.preventDefault();
		validationError.textContent="Complete the form";
	}
	setTimeout(()=>{
		validationError.textContent="";
	},5000)
}




