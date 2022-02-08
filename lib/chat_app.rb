module ChatApp

  class User
    attr_reader :login
    attr_reader :email
    def initialize login, email
      @login = login
      @email = email
    end
  end

  class StringWithLimit < String
    LIMIT = 16
    def initialize(*args)
      super
      raise ArgumentError.new "string exceeds limit of #{LIMIT}" unless self.length < LIMIT
    end
  end

  class Bot
    attr_reader :name
    attr_reader :owner
    def initialize name: , owner:
      @name = name
      @owner = owner
    end
  end

  class Message
    attr_reader :from
    attr_reader :string
    def initialize from, string
      @from = from
      @string = string
    end
  end

  class Channel
    def initialize name

    end
  end
end
