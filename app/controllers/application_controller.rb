class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  helpers do
    def link_for(object)
      resource_url = "/" + object.class.name.downcase + "s"
      id = object.id
      name = object.name
      %{<a href="#{resource_url}/#{id}">#{name}</a>}
    end
  end
end
