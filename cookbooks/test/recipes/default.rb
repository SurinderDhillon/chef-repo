#
# Cookbook Name:: test
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

%w{
  libXtst
  libXtst
  mesa-libGL
  mesa-libGL
  mesa-libGLU
  mesa-libGLU
  mesa-dri-drivers
  mesa-dri-drivers
  mesa-private-llvm
  mesa-private-llvm
  mesa-libglapi
  mesa-filesystem
}.each do |pkg|
package pkg do
	action :remove
    end
end

if File.exist?("/opt/app/oracle/rebuild.txt")
  print "rebuild.txt exists, Starting Instance Rebuild"
#Remove 32-64 bit conflict
%w{
  libXtst.x86_64
  libXtst.i686
  mesa-libGL.i686
  mesa-libGL.x86_64
  mesa-libGLU.i686
  mesa-libGLU.x86_64
  mesa-dri-drivers.x86_64
  mesa-dri-drivers.i686
  mesa-private-llvm.i686
  mesa-private-llvm.x86_64
}.each do |pkg|
package pkg do
        action :remove
    end
end

end


%w{
  binutils.x86_64
  binutils-devel.x86_64
  compat-libcap1.x86_64
  compat-libstdc++-33.x86_64
  compat-libstdc++-33.i686
  gcc.x86_64
  gcc-c++.x86_64
  glibc-common.x86_64
  glibc.x86_64
  glibc.i686
  glibc-devel.i686
  glibc-devel.x86_64
  glibc-utils.x86_64
  ksh.x86_64
  libgcc.i686
  libgcc.x86_64
  libstdc++.i686
  libstdc++.x86_64
  libstdc++-devel.i686
  libstdc++-devel.x86_64
  libaio.i686
  libaio.x86_64
  libaio-devel.i686
  libaio-devel.x86_64
  libXext.i686
  libXext.x86_64
  libXext-devel.i686
  libXext-devel.x86_64
  libXtst.x86_64
  libX11.i686
  libX11.x86_64
  libXau.i686
  libXau.x86_64
  libxcb.i686
  libxcb.x86_64
  libXi.i686
  libXi.x86_64
  make.x86_64
  sysstat.x86_64
  xterm.x86_64
  compat-glibc.x86_64
  tigervnc.x86_64
  tigervnc-server.x86_64
  xorg-x11-server-Xvfb.x86_64
  xorg-x11-server-common.x86_64
  mesa-libGL.x86_64
  mesa-libGLU.i686
  mesa-libGLU.x86_64
  mesa-dri-drivers.x86_64
  mesa-dri-drivers.i686
  mesa-private-llvm.i686
  mesa-private-llvm.x86_64
  libXrender.x86_64
  libXrender.i686
  elfutils.x86_64
  unixODBC.x86_64
  unzip.x86_64
}.each do |pkg|
package pkg do
        action :install
     end
end

#Create Software Install Directory
case node['chef-node']
  when 'dev'
   directory '/opt/app/oracle/PEGADEV1' do
   owner 'oracle'
   group 'dba'
   mode '0755'
   action :create
   end
  when 'tst'
   directory '/opt/app/oracle/PEGATST1' do
   owner 'oracle'
   group 'dba'
   mode '0755'
   action :create
   end
  when 'test'
   directory '/opt/app/oracle/PEGATEST1' do
   owner 'oracle'
   group 'dba'
   mode '0755'
   action :create
   end

#end
else
puts "No Darkstorm Activity"
end
#end


