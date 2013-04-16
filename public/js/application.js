  function loadTweets(user_name) {
    $.get("/latest/"+user_name, function (response) {
      $(".content").html(response);
    });
  }
