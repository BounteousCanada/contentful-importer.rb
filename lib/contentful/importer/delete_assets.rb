require_relative 'command'

module Contentful
	module Importer
		class DeleteAssets < Command
			self.command = 'delete-assets'
			self.summary = 'Delete assets.'

			def self.options
				super.concat(data_options).sort
			end

			def self.import(importer)
				importer.delete_assets
			end

			def run
				super
				self.class.import(@importer)
			end
		end
	end
end
