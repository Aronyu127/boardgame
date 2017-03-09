$(document).on('turbolinks:load', function() {
  submitNewMessage();
});

game_room_ids.map(function(id) {
  App['room' + id] = App.cable.subscriptions.create({channel: 'SpyGameRoomChannel', room: id}, {  
    received: function(data) {
      $("[data-gameRoomId='" + this.gameRoomId + "']").removeClass('hidden')
      return $("[data-gameRoomId='" + this.gameRoomId + "']").append(data.message);
    },

    setGameroomId: function(gameRoomId) {
      this.gameRoomId = gameRoomId
    }
});

function submitNewMessage(){  
  $('textarea#message_content').keydown(function(event) {
    if (event.keyCode == 13) {
      var msg = event.target.value
      var gameRoomId = $("[data-gameRoomId]").data().gameroomid
      App['room' + gameRoomId].setGameroomId(gameRoomId)
      App['room' + gameRoomId].send({message: msg})
      $('[data-textarea="message"]').val(" ")
      return false;
     }
  });
}
