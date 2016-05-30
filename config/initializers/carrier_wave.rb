# if Rails.env.production?
	CarrierWave.configure do |config|
		config.fog_credentials = {
			:provider => 'AWS',
			:aws_access_key_id => 'AKIAI27UBLCH2HFBHI4A',
			:aws_secret_access_key => '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'
		}
		config.fog_directory = 'satyarailsimages'
	end
# end