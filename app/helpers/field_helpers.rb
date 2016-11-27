helpers do
  def text_tag(model, attribute)
    %Q(<label for="#{model.class.name.downcase}[#{attribute}]">#{attribute.capitalize}:</label> <input type="text" name="#{model.class.name.downcase}[#{attribute}]" value="#{model[attribute]}" /><br>)
  end
end