var io = require('socket.io').listen(3001);

io.sockets.on('connection', function (socket) {
  io.sockets.emit('this', { will: 'be received by everyone'});

  socket.on('new_comment', function (from) {
    console.log("NEW COMMENT!!!")
    io.sockets.emit('new_comment');
  });

  socket.on('new_like', function(from) {
    console.log("NEW LIKE!!");
    io.sockets.emit('new_like');
  })

  socket.on('edit_title', function(from) {
    console.log("Title Edited.");
    io.sockets.emit('edit_title');
  })  
});