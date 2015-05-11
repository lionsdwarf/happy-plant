class Plant < ActiveRecord::Base
  belongs_to :user

  validates :name,
            presence: true
  validates :plant_type,
            presence: true
  validates :stamina,
            presence: true,
            numericality: { 
              only_integer: true,
              greater_than: 0,
              less_than: 31 }

  def notify
    account_sid = ENV['TWILIO_ACCT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @twilio_num = ENV['TWILIO_PHONE_NO']
    recipient = "+1" + user.phone_num

    message = @client.account.messages.create(
      :from => @twilio_num,
      :to => recipient,
      :body => "#{name} is thirsty today--please hydrate...",
      :media_url => photo_url
    )
  end

  def query_db
    
  end


end