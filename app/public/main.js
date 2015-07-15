
  var players = [];
  $('.add').click(function(){
    players.push($('.input').val());
  });

  $('.start').click(function(){
    $.post("/tournament",{usernames: players});
  });
