class User < ActiveRecord::Base
  attr_accessible :access_token, :bio, :gender, :hometown, :location, :name, :username

  validates :access_token, :presence => true, :uniqueness => true

  after_create :create_user_profile

  protected

  def create_user_profile
    response = open("http://graph.facebook.com/#{self.access_token}").read
    response = ActiveSupport::JSON.decode(response)
    response.each do |key, value|
      if key == 'name'
        self.name = value
      elsif key == 'username'
        self.username = value
      elsif key == 'gender'
        self.gender = value
      end
    end
    self.save
  end
end
