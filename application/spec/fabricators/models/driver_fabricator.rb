Fabricator(:driver) do
  company
  name { Faker::Name.name }
end
