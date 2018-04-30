json.extract! depoimento, :id, :texto, :usuario_id, :created_at, :updated_at
json.url depoimento_url(depoimento, format: :json)
