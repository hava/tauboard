require "active_resource"

class Resource < ActiveResource::Base

  def self.find(token, options)
    prefix_options, query_options = split_options(options[:params])
    path = collection_path(prefix_options, query_options)
    decode(connection.get(path, token_header(token)).body)
  end

  def self.post(custom_method, options)
    decode(super(custom_method, options).body)
  end

  def self.connection
     ActiveResource::Connection.new(pivotal_site)
  end

  def self.pivotal_site
    "https://www.pivotaltracker.com/services/v3"
  end

  def self.token_header(token)
     {'X-TrackerToken' => token}
  end

  def self.format
    ActiveResource::Formats::XmlFormat
  end

  def self.decode(body)
    ActiveResource::Formats::XmlFormat.decode(body)
  end
end