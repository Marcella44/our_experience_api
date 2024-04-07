class ProfileBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :username, :profile_picture, :about_me
  end

  

end
