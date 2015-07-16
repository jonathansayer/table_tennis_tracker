
  var players = [];

  $('.add').click(function(){
    players.push($('.input').val());
  });

<<<<<<< HEAD
  $('.start').click(function(){
    $.post("/tournament",{'username': players});
  });
=======
  // $('#start').click(function(){
  //   console.log('Hello')
  //   $.post('/tournament',{'username': players});
  // });
>>>>>>> fbdb9cfef1be5ab04a64f6d3eb1f29861a6666a1
