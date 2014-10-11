$(document).ready(function(){

  // Scroll to About 

  $('.page-scroll a').bind('click', function(event) {
      var $anchor = $(this);
      $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top
      }, 1000, 'easeInOutExpo');
      event.preventDefault();
  });

  // Counts input for max 200-character limit

  var charCount;
  
  function updateCharCount() {
    charCount = $("#input_message").val().length;
    $("#charcount").text("Characters left: " + (200-parseInt(charCount)));
    if ($("#input_message").val().length > 200) {
      var content = $("#input_message").val();
    }
  }

  $("#input_message").keydown(function(e){
    updateCharCount();
  });
  
  $("#input_message").keyup(function(e){
    updateCharCount();
  });

  // Send message to Rails to be encoded

  $("input").eq(0).click(function(){

    $.ajax({
      type: "GET",
      url: "/messages/new",
      data: { 
        message: $("#input_message").val(),
        operation: 'encode'
      },
      dataType: "json",
      success: function(response){
        $("#output_message").val(response).hide();
        $("#output_message").fadeIn();
      },
      error: function(response){
      }
    });
  });

  // Send message to Rails to be decoded

  $("input").eq(1).click(function(){

    $.ajax({
      type: "GET",
      url: "/messages/new",
      data: { 
        message: $("#output_message").val(),
        operation: 'decode'
      },
      dataType: "json",
      success: function(response){
        $("#input_message").val(response);
        $("#input_message").val(response).hide();
        $("#input_message").fadeIn();
        updateCharCount();
      },
      error: function(response){
      }
    });
  });

});