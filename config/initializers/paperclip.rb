#Paperclip interpolations

Paperclip.interpolates :id do |attachment, style|
	attachment.instance.id
end

Paperclip.interpolates :access_token do |attachment, style|
	attachment.instance.access_token
end
