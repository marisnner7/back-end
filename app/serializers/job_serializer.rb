class JobSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :gif_url
end
