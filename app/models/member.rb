class Member < ApplicationRecord
    has_secure_password
    
    validates :email, uniqueness: true
    validates :uid, uniqueness: true
    validates_format_of :email, :with =>  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

    
    has_many :member_meetings
    has_many :meetings, through: :member_meetings
    has_many :projects
    has_many :announcements
    

    def update_status
        new_stat=""
        if self.meetings.count>=(Meeting.past.count/2)
            new_stat="active"
        else
            new_stat="potatoe"
        end
        
        self.update(status: new_stat)
    end
    
    def year_from_email
        #updates the user's year as a function of their email, not yet implemented
        grad_year=(self.email.split("@").first/10000).to_i
    end
        
    
    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(provider: auth.provider, uid: auth.uid).first_or_create do |member|
            member.provider=auth.provider
            member.uid = auth.uid
            member.email=auth.info.email
            member.username = auth.info.name
            member.name=auth.info.name
            member.google_token= auth.credentials.token
            member.password=SecureRandom.hex
            member.save
        end
    end
    
    
end
