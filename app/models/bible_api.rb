class BibleApi

  def self.fetch(uri)
    response = HTTParty.get(uri, options)
    response.parsed_response['response']
  end

  def self.options
    {
      basic_auth: {
        username: ENV['BIBLE_AUTH'],
        password: 'X'
      }
    }
  end
end
