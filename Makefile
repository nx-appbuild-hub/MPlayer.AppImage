# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)
DESTINATION="MPlayer.AppImage"

all: clean

	mkdir --parents $(PWD)/build

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mplayer-1.4-9.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mplayer-gui-1.4-9.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/m/mplayer-tools-1.4-9.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libdvdread-5.0.3-9.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/PowerTools/x86_64/os/Packages/enca-1.19-1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm https://download1.rpmfusion.org/free/el/updates/8/x86_64/x/x264-libs-0.157-12.20190717git34c06d1.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm https://download-ib01.fedoraproject.org/pub/epel/8/Everything/x86_64/Packages/l/lirc-libs-0.10.0-19.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libvdpau-1.1.1-7.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/libjpeg-turbo-1.5.3-10.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..

	wget --no-check-certificate --output-document=$(PWD)/build/build.rpm http://mirror.centos.org/centos/8/AppStream/x86_64/os/Packages/SDL-1.2.15-37.el8.x86_64.rpm
	cd $(PWD)/build && rpm2cpio $(PWD)/build/build.rpm | cpio -idmv && cd ..



	cp -r --force $(PWD)/AppDir $(PWD)/build
	cp -r --force $(PWD)/build/usr/* $(PWD)/build/AppDir

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage  $(PWD)/build/AppDir $(PWD)/MPlayer.AppImage
	make clean


clean:
	rm -rf $(PWD)/build
