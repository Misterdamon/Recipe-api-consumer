


function bindRecipeCommentEvents(){
  $("article").on('ajax:success',".upvote_button",function(event, body, status){
    $(this).parent().find(".vote_count").text(body.votes)
  })
  $("article").on('ajax:success',".downvote_button", function(event, body, status){
    $(this).parent().find(".vote_count").text(body.votes)
  })
  $(".comment_button").on("ajax:success",$("[name='commit']"),function(event, data, status){
    template = $("#comment_template").clone()
    template.find("p").text(data.body)
    template.find(".vote_count").text(data.votes)
    $(".comment_feed").append(template)
    $("#comment_body").val("")
    bindEvents()
  })
}