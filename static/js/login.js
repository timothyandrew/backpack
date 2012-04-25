var globalToken = null;
var targetCont = null;
var loginBackpack = function(){
  var opts = {
    "lines": 13,
    "length": 16,
    "width": 4,
    "radius": 25,
    "rotate": 0,
    "trail": 70,
    "speed": 1.1,
    "shadow": true
  }
  if(targetCont)
    target.html(targetCont);
  else
    target = $('.modal-body');

  targetCont = target.html();
  username = $('#username').val();
  var password = $('#password').val();
  target.empty();
  target.height(150);
  spinner = new Spinner(opts).spin(target[0]);
  setTimeout(function() {
	 $.post('/api/login', 'username=' + username + '&password=' + password).success(loginSuccess).error(loginFail);
  }, 1000);
}

var loginSuccess = function(token){
  $('#myModal').modal('hide');
  target.html(targetCont);
  target.height("auto");
	globalToken = token;	
	$('#upload_username').val(username);
	$('#upload_token').val(token);
	$('#notice').html('<div class="alert alert-success"><strong>Logged In!</strong> Your username is ' + username + ' and your token is ' + token + '.</div>');
}

var loginFail = function(opts){
  target.html(targetCont);
  target.height("auto");
  text = opts.responseText;
  target.prepend('<div class="alert alert-error"><strong>' + text + '</strong> Please try again with the correct credentials.</div>');
}
