
  var players = [];
  $('.add').click(function(){
    players.push($('.input').val());
  });

  $('.start').click(function(){
    $.post("/tournament",{username: players});
  });
