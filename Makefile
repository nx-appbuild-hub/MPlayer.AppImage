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

	mkdir --parents $(PWD)/build/Mplayer.AppDir/xmind
	apprepo --destination=$(PWD)/build appdir mplayer mencoder mplayer-doc mplayer-gui vdr-plugin-mplayer vdr-plugin-streamdev-client vdr-plugin-streamdev-server mplayer-skins mplayer-skin-blue

	rm --force $(PWD)/build/Mplayer.AppDir/*.desktop 				| true
	rm --force $(PWD)/build/Mplayer.AppDir/*.svg 					| true
	rm --force $(PWD)/build/Mplayer.AppDir/*.png					| true

	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/Mplayer.AppDir/	| true
	cp --force $(PWD)/AppDir/*.png $(PWD)/build/Mplayer.AppDir/ 	| true
	cp --force $(PWD)/AppDir/*.svg $(PWD)/build/Mplayer.AppDir/ 	| true

	echo "exec \$${APPDIR}/bin/gmplayer \"\$${@}\"" >> $(PWD)/build/Mplayer.AppDir/AppRun

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage  $(PWD)/build/Mplayer.AppDir $(PWD)/MPlayer.AppImage


clean:
	rm -rf $(PWD)/build
