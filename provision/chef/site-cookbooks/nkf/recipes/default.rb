#
# Cookbook Name:: nkf
# Recipe:: default
#

#package "nkf" do
#  action :install
#  not_if "rpm -q nkf"
#end

execute "make & install nkf" do
  command <<-EOS
	  wget -O #{node['nkf']['file-name']}.tar.gz "#{node['nkf']['download-url']}"
		tar zxvf #{node['nkf']['file-name']}.tar.gz
    cd #{node['nkf']['file-name']}
		make && make install
		cd ../
		rm -rf #{node['nkf']['file-name']}
		rm -f #{node['nkf']['file-name']}
		ln -s /usr/local/bin/nkf /usr/bin/nkf
  EOS
  not_if { File.exist?("/usr/bin/nkf") }
end
