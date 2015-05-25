json.array!(@temas) do |tema|
  json.extract! tema, :id, :nome_tema, :assunto_id
  json.url tema_url(tema, format: :json)
end
