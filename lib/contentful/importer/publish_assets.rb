require_relative 'command'

module Contentful
	module Importer
		class PublishAssets < Command
			self.command = 'publish-assets'
			self.summary = 'Publish assets.'

			def self.options
				super.concat(data_options).concat(thread_options).sort
			end

			def self.publish(settings, importer)
				importer.publish_assets_in_threads(settings[:threads])
			end

			def run
				super
				self.class.publish(@settings, @importer)
			end
		end
	end
end
