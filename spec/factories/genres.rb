FactoryBot.define do
  # Nome de filme deve ser único. Devemos garantir que chama
  # create(:movie) duas vezes não irá dar problemas por usar o
  # mesmo nome, então criamos uma sequencia para que o nome nunca
  # se repita, a nao ser que propositalmente
  sequence :genre_names do |n|
    "Genero #{n}"
  end

  factory :genre do
    # generate chama a sequência.
    name { generate(:genre_names) }
  end
end
