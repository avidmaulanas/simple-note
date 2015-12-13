class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # :omniauthable, omniauth_providers: [:facebook, :twitter]
  
  has_many :notes

  validates :username, uniqueness: {case_sensitive: false}

  attr_accessor :signin

  before_create :set_dummy_email, if: :provider_twitter?

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if signin = conditions.delete(:signin)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => signin.downcase }]).first
    else
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name || auth.info.nickname   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def provider_twitter?
    self.provider.eql?("twitter")
  end

  private
    def set_dummy_email
      self.email = "#{self.nickname}@email.com"
    end
end
