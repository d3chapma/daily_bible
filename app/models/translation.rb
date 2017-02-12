class Translation
  attr_reader :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end

  def self.find_by(options)
    translations = BibleApi.fetch(uri)
    translation = translations['versions']['version'].detect { |t| t['name'].include? options[:name] }
    new(translation['id'].first, translation['name'])
  end

  def self.uri
    'https://bibles.org/v2/versions.xml'
  end
end
