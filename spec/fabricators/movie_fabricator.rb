Fabricator(:movie) do
  title { Faker::Lorem.words(num=3) }
  text { Faker::Lorem.sentences(num=3) }
  year { Faker::Number.number(4) }
end
