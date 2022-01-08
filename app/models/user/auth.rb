module User::Auth
  FORMAT_REQUIREMENTS = 'Password must contain lower and uppercase letters, as well as at least 1 digit.'

  extend ActiveSupport::Concern
  
  attr_reader :password
  attr_writer :password_confirmation
  
  included do
    validates :name, presence: true
    validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP, uniqueness: true
    validates :password, presence: true, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/,
                                                   message: FORMAT_REQUIREMENTS },
                         if: proc { |u| u.password_digest.blank? }
    validates :password, confirmation: true
  end
  
  def authenticate(password_string)
    digest(password_string) == password_digest ? self : false
  end

  def password=(password_string)
    if password_string.nil?
      self.password_digest = nil
    elsif password_string.present?
      @password = password_string
      self.password_digest = digest(password_string)
    end
  end

  private

  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
