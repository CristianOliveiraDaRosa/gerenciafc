json.array!(@jogadors) do |jogador|
  json.extract! jogador, :id, :partida_id, :nome, :habilidade, :hab_defesa, :hab_meio, :hab_ataque, :telefone, :email, :mensalista, :ativo
  json.url jogador_url(jogador, format: :json)
end
