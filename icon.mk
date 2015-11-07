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

icondir = $(iconsrootdir)/$(ICONNAME).icon

ICONPNGS = $(ICONNAME)@1024.png $(ICONNAME)@512.png $(ICONNAME)@256.png \
	$(ICONNAME)@128.png $(ICONNAME)@64.png $(ICONNAME)@32.png $(ICONNAME)@16.png

dist_icon_DATA = $(ICONNAME).svg $(ICONNAME).icns $(ICONPNGS) \
	$(top_srcdir)/CC-BY-4.0

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

$(ICONNAME)@1024.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) -x 1024 -y 1024 -f png -o $@ $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) --export-png $(abs_builddir)/$@ -w 1024 -h 1024 $(abs_srcdir)/$<
endif

$(ICONNAME)@512.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) -x 512 -y 512 -f png -o $@ $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) --export-png $(abs_builddir)/$@ -w 512 -h 512 $(abs_srcdir)/$<
endif

$(ICONNAME)@256.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) -x 256 -y 256 -f png -o $@ $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) --export-png $(abs_builddir)/$@ -w 256 -h 256 $(abs_srcdir)/$<
endif

$(ICONNAME)@128.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) -x 128 -y 128 -f png -o $@ $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) --export-png $(abs_builddir)/$@ -w 128 -h 128 $(abs_srcdir)/$<
endif

$(ICONNAME)@64.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) -x 64 -y 64 -f png -o $@ $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) --export-png $(abs_builddir)/$@ -w 64 -h 64 $(abs_srcdir)/$<
endif

$(ICONNAME)@32.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) -x 32 -y 32 -f png -o $@ $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) --export-png $(abs_builddir)/$@ -w 32 -h 32 $(abs_srcdir)/$<
endif

$(ICONNAME)@16.png: $(ICONNAME).svg
if WITH_RSVG_CONVERT
	$(RSVG_CONVERT) -x 16 -y 16 -f png -o $@ $<
endif
if WITH_INKSCAPE
	$(INKSCAPE) --export-png $(abs_builddir)/$@ -w 16 -h 16 $(abs_srcdir)/$<
endif

clean-local:
	rm -rf $(ICONNAME).iconset
