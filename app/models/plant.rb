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
  validates :last_notified,
            presence: true

  def notify
    account_sid = ENV['TWILIO_ACCT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @twilio_num = ENV['TWILIO_PHONE_NO']
    recipient_array = user.recipients

    recipient_array.each do |recipient|

      phone = "+1" + recipient.phone_num
  
      message = @client.account.messages.create(
        :from => @twilio_num,
        :to => phone,
        :body => "Hi #{recipient.name}, #{name} is getting thirsty...please hydrate...",
        :media_url => photo_url
      )
      last_notified = DateTime.now
    end
  end

  def thirst_checker
    # stamina = stamina * 86400
    last_notified = last_notified.to_i
    now = DateTime.now.to_i
    if now > last_notified + stamina
      self.notify
    end 
  end


end