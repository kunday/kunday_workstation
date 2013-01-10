unless File.exists?("/Applications/Caffeine.app") do
	remote_file "#{Chef::Config[:file_cache_path]}/Caffeine.zip" do
		source "http://download.lightheadsw.com/download.php?software=caffeine"
		owner WS_USER
	end
	execute "unzip Caffeine" do
		command "unzip #{Chef::Config[:file_cache_path]}/Caffeine.zip -d #{Chef::Config[:file_cache_path]}/"
		user WS_USER
	end 
	execute "copy Caffeine to /Applications" do
		command "mv #{Chef::Config[:file_cache_path]}/Caffeine.app #{Regexp.escape("/Applications/Caffeine.app")}"
		user WS_USER
		group "admin"
	end 

	ruby_block "test to see if Caffeine.app was installed" do
		block do
			raise "Caffeine.app was not installed" unless File.exists?("/Applications/Caffeine.app")
		end
	end
end
