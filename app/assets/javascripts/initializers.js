$(document).ready(function(){
  controller = new MarkdownWidget.Controller(
    new MarkdownWidget.View("#recipe_content",'#markdown_template'))
  bindWidgetEvents();
  bindRecipeCommentEvents()
})


