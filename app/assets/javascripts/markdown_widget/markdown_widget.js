function bindWidgetEvents(){
 $("#recipe_content").on("keyup", MarkdownWidget.Controller.prototype.interpretText)
}


