Cucumber::Persona.define "New User" do
  u = User.create!(email: "user@example.com", password: "Password1")
  t = u.trees.create!(name: "My Tree", public_uuid: 'abcdefg')
  root = t.objectives.create!(title: "0-A")

  a1 = root.children.create!(title: "1-A")
  aa2 = a1.children.create!(title: "2-A-A")
  ba2 = a1.children.create!(title: "2-A-B")

  b1 = root.children.create!(title: "1-B")
  ab2 = a1.children.create!(title: "2-B-A")

  t = u.traits.create!(title: "Armor")
  a1.objective_traits.create!(trait: t, amount: 10)

  other_tree = u.trees.create!(name: "Other Tree")
  other_tree.objectives.create!(title: "Other-A")
end
