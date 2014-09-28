$(document).ready(function(){

  // Send message to Rails to be translated

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
      },
      error: function(response){
        console.log("Ajax request failed");
        console.log("response: "+response);
      }
    })
  });

})