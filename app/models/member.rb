class Member < ApplicationRecord
    has_secure_password
    
    has_many :member_meetings
    has_many :meetings, through: :member_meetings
    

    def update_status
        new_stat=""
        if self.meetings.count>=(Meeting.past.count/2)
            new_stat="active"
        else
            new_stat="potatoe"
        end
        
        self.update(status: new_stat)
    end
        
    
    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
            member.provider=auth.provider
            member.uid = auth.uid
            member.email=auth.info.email
            member.username = auth.info.name
            member.google_token= auth.credentials.token
            member.password=SecureRandom.hex
            member.save
        end
    end
end
