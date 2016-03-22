class Message < ActiveRecord::Base

  validates :author, presence: true

  validates :url, allow_blank: true, :format => URI::regexp(%w(http https)) if :url

end
