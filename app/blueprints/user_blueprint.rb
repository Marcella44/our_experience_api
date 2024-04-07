class UserBlueprint < Blueprinter::Base
  identifier :id

  view :default do
    fields :email
  end

  view :extended do
    fields :email, :admin
    association :profile, blueprint: ProfileBlueprint

  end
end