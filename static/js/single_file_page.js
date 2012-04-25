$(document).ready(function(){
  //Get metadata first
  var hash = window.location.pathname.split('/')[2];
  $.post('/api/metadata/' + hash, '').success(showMetadata).error(fail);

  updateInterfaceFromCookieState();
  var loc = window.location;
  if(loc.hash == '#new'){
    $('#notice').html('<div class="alert alert-success"><strong>Saved!</strong> Your file has been saved and can be accessed at ' + loc.origin + loc.pathname + '.</div>');
    window.location.hash = '';
  }
});

var showMetadata = function(data){
  var metadata = $.parseJSON(data);
  $("#title").text(metadata.title);
  $("#uploaded-by").text(metadata.belongs_to);
}

var fail = function(opts){
  console.log(opts);
  $("#notice").html('<div class="alert alert-error"><strong>ERROR!</strong> While doing something AJAX-y.</div>');
}