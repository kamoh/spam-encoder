$(document).ready(function(){

  // Scroll to About 

  $('.page-scroll a').bind('click', function(event) {
      var $anchor = $(this);
      $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top
      }, 1000, 'easeInOutExpo');
      event.preventDefault();
  });


  var charCount;

  // Counts input for max 200-character limit
  
  function updateCharCount() {
    charCount = $("#input_message").val().length;
    $("#charcount").text("Characters left: " + (200-parseInt(charCount)));
    if ($("#input_message").val().length > 200) {
      var content = $("#input_message").val();
      console.log("too many chars");
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
        console.log("Ajax request successful");
        console.log("response: "+response);
        $("#output_message").val(response);
      },
      error: function(response){
        console.log("Ajax request failed");
        console.log("response: "+response);
      }
    })
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
        console.log("Ajax request successful");
        console.log("response: "+response);
        $("#input_message").val(response);
        updateCharCount();
      },
      error: function(response){
        console.log("Ajax request failed");
        console.log("response: "+response);
      }
    })
  });

})