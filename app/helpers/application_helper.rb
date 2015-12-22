module ApplicationHelper
  def editable(
      object,
      method,
      display_with: nil,
      tag: "span",
      activate: true
    )

    datatype        = object.class.columns_hash[method.to_s].type
    model           = object.class.model_name.singular
    id              = object.send object.class.primary_key
    url             = url_for(object)
    identifier      = "#{method}_#{model}_#{id}"
    raw_value       = object.send(method)
    value           = display_with ? send(display_with, raw_value) : raw_value
    if activate == true
      activate_text = "contenteditable=\"\""
    else
      activate_text = "data-editable-activate=\"#{activate.to_s}\""
    end
    
    return "
      <#{tag} class=\"editable\"\
      data-editable=\"#{identifier}\"\
      data-editable-model=\"#{model}\"\
      data-editable-id=\"#{id}\"\
      data-editable-method=\"#{method}\"\
      data-editable-datatype=\"#{datatype}\"\
      data-editable-value=\"#{raw_value}\"\
      data-editable-url=\"#{url}\"\
      data-editable-display-with=\"#{display_with}\"
      #{activate_text}>
        #{value}
      </#{tag}>
      ".html_safe
  end
end