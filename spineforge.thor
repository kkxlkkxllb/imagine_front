class Spineforge < Thor
	include Thor::Actions
	# thor spineforge:fuse ios

	desc "fuse ios/android","builds and runs app"
	def fuse(platform)
		#cd spineapp
		@spineapp_dir = File.dirname(__FILE__)
		@forge_dir = @spineapp_dir + '/../'
		inside @spineapp_dir do
			run('cd')
			run('hem build')
		end
		#copy spineapp/public/* to src/
		Thor::Sandbox::Spineforge.source_root(@spineapp_dir)
		directory 'public', @forge_dir + 'src'

		inside @forge_dir do
			#forge build
			run 'forge build'
			#forge run platform
			run "forge run #{platform}"
		end
	end

end
