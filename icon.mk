## Copyright 2015 Mo McRoberts.
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##      http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.

RSVGPNGOPTS = -z -f png -y 0.0 -o $@
INKSCAPEPNGOPTS = -z -y 0.0 --export-png $(abs_builddir)/$@

icondir = $(iconsrootdir)/$(ICONNAME).icon

ICONPNGS = $(ICONNAME)@1024.png $(ICONNAME)@512.png $(ICONNAME)@256.png \
	$(ICONNAME)@128.png $(ICONNAME)@64.png $(ICONNAME)@32.png $(ICONNAME)@16.png

dist_icon_DATA = $(ICONNAME).svg $(ICONPNGS) \
	$(top_srcdir)/CC-BY-4.0

dist_noinst_DATA = $(ICONNAME).icns

noinst_DATA = $(ICONNAME).r

DISTCLEANFILES = $(ICONPNGS) $(ICONNAME).icns

CLEANFILES = $(ICONNAME).r

$(ICONNAME).icns: $(ICONPNGS)
if WITH_ICONUTIL
	test -d $(ICONNAME).iconset || mkdir $(ICONNAME).iconset
	cp $(ICONNAME)@1024.png $(ICONNAME).iconset/icon_512x512@2x.png
	cp $(ICONNAME)@512.png $(ICONNAME).iconset/icon_512x512.png
	cp $(ICONNAME)@512.png $(ICONNAME).iconset/icon_256x256@2x.png
	cp $(ICONNAME)@256.png $(ICONNAME).iconset/icon_256x256.png
	cp $(ICONNAME)@256.png $(ICONNAME).iconset/icon_128x128@2x.png
	cp $(ICONNAME)@128.png $(ICONNAME).iconset/icon_128x128.png
	cp $(ICONNAME)@64.png $(ICONNAME).iconset/icon_32x32@2x.png
	cp $(ICONNAME)@32.png $(ICONNAME).iconset/icon_32x32.png
	cp $(ICONNAME)@32.png $(ICONNAME).iconset/icon_16x16@2x.png
	cp $(ICONNAME)@16.png $(ICONNAME).iconset/icon_16x16.png
	$(ICONUTIL) -c icns -o $(ICONNAME).icns $(ICONNAME).iconset
endif

$(ICONNAME).r: $(top_srcdir)/icon.mk
	echo "read 'icns' (-16455) \"$(ICONNAME).icns\";" > $(ICONNAME).r

$(ICONNAME)@1024.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) $(RSVGPNGOPTS) -x 1024 -y 1024 $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) $(INKSCAPEPNGOPTS) -w 1024 -h 1024 $(abs_srcdir)/$<
endif

$(ICONNAME)@512.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) $(RSVGPNGOPTS) -x 512 -y 512 $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) $(INKSCAPEPNGOPTS) -w 512 -h 512 $(abs_srcdir)/$<
endif

$(ICONNAME)@256.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) $(RSVGPNGOPTS) -x 256 -y 256 $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) $(INKSCAPEPNGOPTS) -w 256 -h 256 $(abs_srcdir)/$<
endif

$(ICONNAME)@128.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) $(RSVGPNGOPTS) -x 128 -y 128 $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) $(INKSCAPEPNGOPTS) -w 128 -h 128 $(abs_srcdir)/$<
endif

$(ICONNAME)@64.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) $(RSVGPNGOPTS) -x 64 -y 64 $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) $(INKSCAPEPNGOPTS) -w 64 -h 64 $(abs_srcdir)/$<
endif

$(ICONNAME)@32.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) $(RSVGPNGOPTS) -x 32 -y 32 $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) $(INKSCAPEPNGOPTS) -w 32 -h 32 $(abs_srcdir)/$<
endif

$(ICONNAME)@16.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) $(RSVGPNGOPTS) -x 16 -y 16 $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) $(INKSCAPEPNGOPTS) -w 16 -h 16 $(abs_srcdir)/$<
endif

clean-local:
	rm -rf $(ICONNAME).iconset

install-data-hook: $(ICONNAME).icns $(ICONNAME).r
if WITH_REZ_SETFILE
	$(MKDIR_P) $(DESTDIR)$(icondir)
	$(REZ) -o $(DESTDIR)$(icondir)/`printf 'Icon\r'` $(ICONNAME).r
	$(SETFILE) -a C $(DESTDIR)$(icondir)
endif
