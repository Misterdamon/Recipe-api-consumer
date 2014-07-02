MarkdownWidget.Controller = function(view){
  this.view = view;
}

MarkdownWidget.Controller.prototype.interpretText = function(text){
  this.view = controller.view
  this.text = event.currentTarget.value;
  var convertedText = convertTextToHtml(this.text)
  this.view.showPreview(convertedText)
}


function convertTextToHtml(text){
  var convertedText = text.replace(/\*{2}\b/g, "<strong>")
  convertedText = convertedText.replace(/(\b\*{2})/g, "</strong>")
  var convertedText = convertedText.replace(/\*{1}\b/g, "<em>")
  convertedText = convertedText.replace(/(\b\*{1})/g, "</em>")
  return convertedText
}