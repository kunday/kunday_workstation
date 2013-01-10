unless File.exists?("/Applications/MacVim.app")
  directory Chef::Config[:file_cache_path] do
    action :create
    recursive true
  end

  remote_file "#{Chef::Config[:file_cache_path]}/macvim.zip" do
    source "https://macvim.googlecode.com/files/MacVim-snapshot-66.tbz"
    owner WS_USER
  end

  execute "extract text mate to /Applications" do
    command "tar -xvf #{Chef::Config[:file_cache_path]}/macvim.zip -C /Applications/"
    user WS_USER

    # This is required to unzip into Applications
    group "admin"
  end

end

