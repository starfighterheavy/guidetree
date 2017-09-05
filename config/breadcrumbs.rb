crumb :root do
  link "Home", root_path
end

crumb :tree do |tree|
  link tree.name, tree
end

crumb :objective do |objective|
  link objective.title, objective
  parent :tree, objective.tree
end
