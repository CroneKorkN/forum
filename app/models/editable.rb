class Editable
  def initialize(
      object,
      method,
      display_with: nil,
      tag: "span",
      classname: "editable",
      active: false,
      ondemand: false
    )

    datatype   = object.class.columns_hash[method.to_s].type
    model      = object.class.model_name.singular
    id         = object.send object.class.primary_key
    url        = url_for(object)
    identifier = "#{model}_#{id}_#{method}"
    raw_value  = object.send(method)
    value      = eval "#{display_with} raw_value"
    contenteditable = "contenteditable=\"\"" if active
    ondemand_class  =  ondemand ? "ondemand" : ""
    # value = send(display_with, raw_value)


  end
  
  def print
    "
      <#{@tag} class=\"#{@classname} #{@ondemand}\" data-editable=\"#{@identifier}\"\
        data-editable-model=\"#{@model}\"\
        data-editable-id=\"#{@id}\"\
        data-editable-method=\"#{@method}\"\
        data-editable-datatype=\"#{@datatype}\"\
        data-editable-value=\"#{@raw_value}\"\
        data-editable-url=\"#{@url}\"\
        data-editable-display-with=\"#{@display_with}\"
      #{@contenteditable}>#{@value}</#{@tag}>
    ".html_safe
  end
end