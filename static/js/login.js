var targetCont = null;

$(document).ready(function(){
  updateInterfaceFromCookieState();
});

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
  
  target = $('.modal-body');

  targetCont = target.html();
  username = $('#username').val();
  var password = $('#password').val();
  target.height(150);
  spinner = new Spinner(opts).spin(target[0]);
  setTimeout(function() {
	 $.post('/api/login', 'username=' + username + '&password=' + password).success(loginSuccess).error(loginFail);
  }, 1000);
}

var loginSuccess = function(data){
  var data = $.parseJSON(data);
  $('#myModal').modal('hide');
  target.height("auto");
  console.log(data);
  var expireDate = new Date(data.expires);  	
  document.cookie = 'username=' + username + '; expires=' + expireDate + '; path=/';
	document.cookie = 'token=' + data.token + '; expires=' + expireDate + '; path=/';
  updateInterfaceFromCookieState();
	$('#notice').html('<div class="alert alert-success"><strong>Logged In!</strong> Your username is ' + username + ' and your token is ' + data.token + '.</div>');
}

var loginFail = function(opts){
  console.log(opts);
  target.html(targetCont);
  target.height("auto");
  text = opts.responseText;
  target.prepend('<div class="alert alert-error"><strong>' + text + '</strong> Please try again with the correct credentials.</div>');
}

var logout = function(){
  $.post('/api/login', 'username=' + username + '&logout=true').success(function(){
    $('#LogoutModal').modal('hide');
    eraseCookie('username');
    eraseCookie('token');
    updateInterfaceFromCookieState();
    $('#notice').html('<div class="alert alert-danger"><strong>Logged out!</strong></div>');
  }).error(loginFail);
}

var updateInterfaceFromCookieState = function(){
  //Logged in/out
  var token = readCookie('token');
  var username = readCookie('username');
  if(token){
    $('#pop').html("Logged in as " + username + "<b class='caret'></b>");
    $('#pop').attr('onclick', "javascript:$('#LogoutModal').modal('show');");
    $('#upload_username').val(username);
    $('#upload_token').val(token);
  } else {
    $('#pop').html("Login/Register <b class='caret'></b>");
    $('#pop').attr('onclick', "javascript:$('#myModal').modal('show');");
    $('#upload_username').val('');
    $('#upload_token').val('');
  }
}

function createCookie(name,value,days) {
  if (days) {
    var date = new Date();
    date.setTime(date.getTime()+(days*24*60*60*1000));
    var expires = "; expires="+date.toGMTString();
  }
  else var expires = "";
  document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  for(var i=0;i < ca.length;i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
}

function eraseCookie(name) {
  createCookie(name,"",-1);
}