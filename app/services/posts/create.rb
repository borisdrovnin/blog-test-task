module Posts
  class Create
    def self.call(data)
      Posts::Create.new(data).call
    end

    def initialize(data)
      @data = data
    end

    def call
      validate!
      Post.create!({
        user: user,
        title: title,
        content: content,
        ip: ip
      })
    end

    def validate!
      JSON::Validator.validate!(JsonSchema::Post::Create, @data)
    end

    def user
      User.find_by(login: login) || User.create(login: login)
    end

    def login
      @data[:login]
    end

    def content
      @data[:content]
    end

    def title
      @data[:title]
    end

    def ip
      @data[:ip]
    end

  end
end