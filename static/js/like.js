var like = function(){  
  var hash = window.location.pathname.match(/\/\w+\/(\w+)/)[1]
  window.socket.emit("new_like");
  $.post('/api/storemd', 'hash=' + hash + '&type=' + 'likes').success(likeSuccess).error(fail);
}

var likeSuccess = function(data) {
  console.log(data);
}

var fail = function(opts){
  console.log(opts);
}