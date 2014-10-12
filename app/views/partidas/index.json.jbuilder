json.array!(@partidas) do |partida|
  json.extract! partida, :id, :usuario_id, :descricao, :tipo, :dia_semana
  json.url partida_url(partida, format: :json)
end
