if Rails.env == "development"
  Elasticsearch::Model.client = Elasticsearch::Client.new
else
  Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']
end