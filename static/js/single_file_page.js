$(document).ready(function(){
  $("#title_edit_close").hide();
  $("#title_edit_save").hide();
  //Get metadata first
  var hash = window.location.pathname.split('/')[2];
  $.post('/api/metadata/' + hash, '').success(showMetadata).error(fail);

  updateInterfaceFromCookieState();
  var loc = window.location;
  if(loc.hash == '#new'){
    $('#notice').html('<div class="alert alert-success"><strong>Saved!</strong> Your file has been saved and can be accessed at ' + loc.origin + loc.pathname + '.</div>');
    window.location.hash = '';
  }

  window.socket = io.connect(window.location.protocol + "//" + window.location.hostname + ':3001/');
  window.socket.on('new_comment', function(){
    window.location.reload();
  })

  window.socket.on('new_like', function(){
    var currentLikes = $('#like_count').text();
    $('#like_count').text(parseInt(currentLikes) + 1);
  });
});

var showMetadata = function(data) {
  console.log(data);
  var metadata = $.parseJSON(data);
  $("#title").text(metadata.title);
  $("#uploaded-by").text(metadata.belongs_to);
  $("#uploaded-by").attr("href", "/files/" + metadata.belongs_to)
  $("#like_count").text(metadata.likes);

  for(var i=0; i< metadata.comments.length; i++){
    $("#comments").append("<div class='comment-box'>" + metadata.comments[i].text + "</div>")
    console.log(metadata.comments[i]);
  }
}

var fail = function(opts){
  console.log(opts);
  $("#notice").html('<div class="alert alert-error"><strong>ERROR!</strong> While doing something AJAX-y.</div>');
}

var showCommentField = function(){
  $("#banner").append("<input type='textarea' id='comment_text'></input><button class='btn btn-success' onclick='javascript:saveComment();'>Save</button>")
}

var saveComment = function() {
  var hash = window.location.pathname.match(/\/\w+\/(\w+)/)[1]
  $.post('/api/storemd', 'hash=' + hash + '&type=' + 'comments&comment_text=' + $('#comment_text').val()).success(function(data){
    window.socket.emit('new_comment');
    console.log("Comment saved " + data);
  }).error(fail);
}

var editTitle = function () {
  window.filetitle = $("#title").text();
  $("#title").html("<input id='title_textarea' type='textarea'></input>");
  $("#title_textarea").val(window.filetitle);
  $("#title_edit").hide();
  $("#title_edit_close").show();
  $("#title_edit_save").show();
}

var closeEditTitle = function () {
  $("#title").html('');
  $("#title").text(window.filetitle);
  $("#title_edit").show();
  $("#title_edit_close").hide();
  $("#title_edit_save").hide();
}

var saveTitle = function(){  
  var newTitle = $("#title_textarea").val();
  closeEditTitle();
  $("#title").text(newTitle);
  var hash = window.location.pathname.match(/\/\w+\/(\w+)/)[1]
  $.post('/api/storemd', 'hash=' + hash + '&type=title&title=' + newTitle).success(function(data){ 
    console.log(data);
  }).error(fail);
}