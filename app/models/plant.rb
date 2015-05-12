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
    # puts "notify called"
    account_sid = ENV['TWILIO_ACCT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @twilio_num = ENV['TWILIO_PHONE_NO']
    recipient = "+1" + user.phone_num

    message = @client.account.messages.create(
      :from => @twilio_num,
      :to => recipient,
      :body => "#{name} is getting thirsty...Please hydrate with tepid water.",
      :media_url => photo_url
    )
    last_notified = DateTime.now.to_i.to_s
  end

  def thirst_checker
    # puts "thirst checker called"
    # stamina = stamina * 86400
    last_notified = last_notified.to_i
    now = DateTime.now.to_i
    if now > last_notified + stamina
      self.notify
    end 
  end


end