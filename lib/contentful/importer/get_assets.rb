require_relative 'command'

module Contentful
	module Importer
		class GetAssets < Command
			self.command = 'get-assets'
			self.summary = 'Get all assets as csv.'

			def self.options
				super.concat(data_options).sort
			end

			def self.import(importer)
				importer.get_all_assets
			end

			def run
				super
				self.class.import(@importer)
			end
		end
	end
end
