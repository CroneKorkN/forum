json.array!(@permissions) do |permission|
  json.extract! permission, :id, :permissible_type, :permissible_id, :action
  json.url permission_url(permission, format: :json)
end
