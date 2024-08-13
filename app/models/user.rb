class User < ApplicationRecord
    has_many :entries, dependent: :destroy
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    normalizes :email, with: -> email { email.strip.downcase }
    normalizes :password, with: -> password { password.strip }
    normalizes :password_confirmation, with: -> password_confirmation { password_confirmation.strip }

    validate :password_contains_number
    validate :password_contains_lowercase
    validate :password_contains_uppercase
    validate :password_contains_special_character
    validate :password_length
    validate :passwords_match

    validate :first_name_present
    validate :last_name_present

    validates :email, format: { with: Devise.email_regexp }

    alias :orig_valid_password? :valid_password?
    def valid_password?(password)
        orig_valid_password?(password.strip)
    end

    private

    def passwords_match
      if password_confirmation.blank?
          errors.add :password_confirmation, "can't be blank."
        return false
      end
      true
    end

    def password_length
        if password.blank? || password.length < 8
          errors.add :password, "must be at least 8 characters long."
          false
        else
          true
        end
    end

    def password_contains_number
      return if password.blank? || password.match?(/\d/)
  
      errors.add(:password, 'must contain at least one number.')
    end

    def password_contains_uppercase
      return if password.blank? || password.match?(/[A-Z]/)
  
      errors.add(:password, 'must contain at least one uppercase letter.')
    end

    def password_contains_lowercase
      return if password.blank? || password.match?(/[a-z]/)
  
      errors.add(:password, 'must contain at least one lowercase letter.')
    end

    def password_contains_special_character
      return if password.blank? || password.match?(/[\W_]/)
  
      errors.add(:password, 'must contain at least one special character.')
    end

    def first_name_present
      if first_name.blank?
        errors.add :first_name, "can't be blank."
        false
      else
        true
      end
    end

    def last_name_present
      if last_name.blank?
        errors.add :last_name, "can't be blank."
        false
      else
        true
      end
    end

end
