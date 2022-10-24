FactoryBot.define do
  # Nome de filme deve ser único. Devemos garantir que chama
  # create(:movie) duas vezes não irá dar problemas por usar o
  # mesmo nome, então criamos uma sequencia para que o nome nunca
  # se repita, a nao ser que propositalmente
  sequence :film_names do |n|
    "Filme #{n}"
  end

  factory :movie do
    # generate chama a sequência.
    name { generate(:film_names) }
    genre { association :genre }
  end
end
