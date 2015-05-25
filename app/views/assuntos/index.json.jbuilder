json.array!(@assuntos) do |assunto|
  json.extract! assunto, :id, :nome_assunto, :descricao, :link_image
  json.url assunto_url(assunto, format: :json)
end
