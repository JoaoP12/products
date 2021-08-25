class User < ApplicationRecord
  has_secure_password
  before_create :generate_registration_confirmation_token
  
  validates :email, presence: true, format: {
    with: /\A[^@\s]+@[^@\s]+\z/,
    message: "must be a valid email address"
  }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    self.save
    UserMailer.password_reset(self).deliver_later
  end

  def send_registration_confirmation
    self.save
    UserMailer.registration_confirmation(self).deliver_now
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  private
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
  def generate_registration_confirmation_token
    generate_token(:confirm_token)
  end

end