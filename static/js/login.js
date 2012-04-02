var globalToken = null;

function login(){
	var username = $('#username').val();
	var password = $('#password').val();
	$.post('/api/login', 'username=' + username + '&password=' + password, loginSuccess);
}

var loginSuccess = function(token){
	globalToken = token;	
	$('#upload_username').val($('#username').val());
	$('#upload_token').val(token);
	$('#login.container').html('<h1>Logged in!</h1>');
}