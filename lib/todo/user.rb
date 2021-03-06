require 'bcrypt'

module Todo
  class User
    def initialize(email: nil, password: nil, first_name: nil, last_name: nil)
      @email      = email
      @password   = BCrypt::Password.create(password)
      @first_name = first_name
      @last_name  = last_name
      @list       = [ ]
    end

    attr_reader :email, :password, :first_name, :last_name, :list

    def valid?
      email =~ /\S/ && password =~ /\S/ && first_name =~ /\S/ && last_name =~ /\S/
    end

    def errors
      errors = [ ]
      unless email =~ /\S/
        errors << "Email can't be blank."
      end
      unless password =~ /\S/
        errors << "Password can't be blank."
      end
      unless first_name =~ /\S/
        errors << "First name can't be blank."
      end
      unless last_name =~ /\S/
        errors << "Last name can't be blank."
      end
    end

    def add_task(item)
      @list.unshift(item)
    end

    def delete_task(task)
      @list.delete( list.find { |item| item.slug == task } )
    end
  end
end
