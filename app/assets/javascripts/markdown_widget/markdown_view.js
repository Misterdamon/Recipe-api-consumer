
MarkdownWidget.View = function(selector, template){
  this.selector = selector;
  this.template = template || "markdown!!";
}

MarkdownWidget.View.prototype.showPreview = function(convertedText){
  var text = convertedText;
  //replace with mustache template
  var template = $("#markdown_template")[0]
  $(template).closest("p").html(text)
  $(template).css("display", "block");
  $(".preview_container").append(template)
}
