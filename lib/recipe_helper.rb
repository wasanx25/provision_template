method = <<-EOS
  def include_cookbook(name)
    root_dir = File.expand_path('../..', __FILE__)
    include_recipe File.join(root_dir, 'cookbooks', name, 'default')
  end
EOS

if defined?(Itamae)
  Itamae::Recipe.class_eval(method)
elsif defined?(MItamae)
  MItamae::RecipeContext.class_eval(method)
end
