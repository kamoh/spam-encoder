$(document).ready(function(){

  // Send message to Rails to be translated

  $("input").click(function(){

    $.ajax({
      type: "GET",
      url: "/messages/new",
      data: { 
        message: $("#input_message").val()
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

})