unless File.exists?("/Applications/MacVim.app")
  directory Chef::Config[:file_cache_path] do
    action :create
    recursive true
  end

  remote_file "#{Chef::Config[:file_cache_path]}/macvim.tbz" do
    source "https://macvim.googlecode.com/files/MacVim-snapshot-66.tbz"
    owner WS_USER
  end

	execute "create local directory" do
		command "mkdir -p #{Chef::Config[:file_cache_path]}/MacVim"
		user WS_USER

    group "admin"
	end

  execute "extract mac vim to local" do
    command "tar -xvf #{Chef::Config[:file_cache_path]}/macvim.tbz -C #{Chef::Config[:file_cache_path]}/MacVim"
    user WS_USER

    # This is required to unzip into Applications
    group "admin"
  end

  execute "copy mac vim to applications" do
    command "cp -r #{Chef::Config[:file_cache_path]}/MacVim/MacVim-snapshot-66/MacVim.app /Applications/"
    user WS_USER

    # This is required to unzip into Applications
    group "admin"
  end

end

