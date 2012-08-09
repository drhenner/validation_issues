class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :nick_name
  acts_as_validation_issues

  validates :first_name,  :presence => true
  validates :last_name,   :presence => true
  validates :nick_name,   :presence     => false#,
                          #:format       => { :with => /w+/ },
                          #:allow_blank  => true
end
