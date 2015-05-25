json.array!(@questaos) do |questao|
  json.extract! questao, :id, :pergunta, :resposta, :dica, :tema_id
  json.url questao_url(questao, format: :json)
end
