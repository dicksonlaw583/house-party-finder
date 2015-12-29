class AlbumAttachment < ActiveRecord::Base
	before_create :generate_access_token

	belongs_to :party
	has_attached_file :picture, :url => '/system/uploads/picture_:style_:access_token.:extension', :path => ":rails_root/public:url", :styles => { :medium => "320x240>", :thumbnail => "160x120>" }, :default_url => "/images/default-picture.jpg"
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	private

	# simple random salt
	def random_salt(len = 20)
		chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
		salt = ""
		1.upto(len) { |i| salt << chars[rand(chars.size-1)] }
		return salt
	end

	# SHA1 from random salt and time
	def generate_access_token
		self.access_token = Digest::SHA1.hexdigest("#{random_salt}#{Time.now.to_i}")
	end
end
