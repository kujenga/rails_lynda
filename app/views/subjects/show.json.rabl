object @subject
attributes :id, :name, :position, :visible

node(:edit_test) { "..." }

child :pages do
  attributes :id, :name, :permalink
end