class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :ratings
  has_many :rated_parties, :through => :ratings, :source => :party
  has_many :subscriptions
  has_many :subscribers, :through => :subscriptions, :source => :subscriber
  has_many :out_subscriptions, :class_name => 'Subscription', :foreign_key => 'subscriber_id'
  has_many :out_subscribers, :through => :out_subscriptions, :source => :user
  has_many :hosted_parties, :class_name => 'Party', :foreign_key => 'host_id'
  has_many :album_attachments, :through => :hosted_parties
  has_many :received_ratings, :through => :hosted_parties, :source => :ratings
  has_many :attendances
  has_many :attended_parties, :through => :attendances, :source => :party

  has_attached_file :avatar, :url => '/system/uploads/avatar_:style_:id.:extension', :path => ":rails_root/public:url", :styles => { :medium => "240x240>", :thumbnail => "64x64>" }, :default_url => "/images/default-avatar.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :username, :uniqueness => true, :presence => true
  validates :first_name, :last_name, :address, :city, :province, :presence => true
  validates :latitude, :longitude, :numericality => true

  def rating_score
  	User.where({ id: self.id }).joins(:received_ratings).average(:score)
  end

  def rating_count
  	User.where({ id: self.id }).joins(:received_ratings).count
  end

  def join_date
    self.created_at
  end
end
