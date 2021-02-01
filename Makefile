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

all: clean
	mkdir --parents $(PWD)/build/Boilerplate.AppDir
	apprepo --destination=$(PWD)/build appdir boilerplate qmapshack libqt5webenginecore5 libqt5xml5 libqt5sql5 libqt5dbus5 libgdal26 \
							libproj15  libroutino0 libalglib3.14 libquazip5-1 libqt5printsupport5  libqt5widgets5 \
							libqt5qml5 libqt5network5 libqt5gui5 libqt5core5a libqt5quick5 proj-data gdal-bin




	echo 'ls $${HOME}/.QMapShack > /dev/null 2>&1 | mkdir --parents $${HOME}/.QMapShack' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'cp --force $${APPDIR}/share/qt5/resources/* $${HOME}/.QMapShack' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun

	echo 'exec $${APPDIR}/bin/qmapshack "$${@}"' >> $(PWD)/build/Boilerplate.AppDir/AppRun

	rm -f $(PWD)/build/Boilerplate.AppDir/*.desktop 	| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.png 		| true
	rm -f $(PWD)/build/Boilerplate.AppDir/*.svg 		| true	

	cp --force $(PWD)/AppDir/*.svg 		$(PWD)/build/Boilerplate.AppDir 			| true	
	cp --force $(PWD)/AppDir/*.desktop 	$(PWD)/build/Boilerplate.AppDir 			| true	
	cp --force $(PWD)/AppDir/*.png 		$(PWD)/build/Boilerplate.AppDir 			| true	

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/QMapShack.AppImage
	chmod +x $(PWD)/QMapShack.AppImage

clean:
	rm -rf ${PWD}/build
