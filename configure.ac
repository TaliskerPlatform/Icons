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

AC_INIT([Icons],[develop])
AC_PREFIX_DEFAULT([/Preview])
AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE

AC_CHECK_PROG([RSVG_CONVERT],[rsvg-convert],[rsvg-convert])
if test x"$RSVG_CONVERT" = x""; then
	AC_CHECK_PROG([INKSCAPE],[inkscape],[inkscape])
else
	INKSCAPE=""
fi

AM_CONDITIONAL([WITH_RSVG_CONVERT],[test -n "$RSVG_CONVERT"])
AM_CONDITIONAL([WITH_INKSCAPE],[test -n "$INKSCAPE"])

if test x"$RSVG_CONVERT" = x"" && test x"$INKSCAPE" = x"" ; then
	AC_MSG_WARN([neither 'rsvg-convert' nor 'inkscape' could be found; PNGs won't be re-generated if SVGs are modified])
fi

AC_CHECK_PROG([ICONUTIL],[iconutil],[iconutil])

AM_CONDITIONAL([WITH_ICONUTIL],[test -n "$ICONUTIL"])

if test x"$ICONUTIL" = x"" ; then
	AC_MSG_WARN(['iconutil' could not be found; .icns won't be re-generated if SVGs are modified])
fi

AC_CHECK_PROG([REZ],[Rez],[Rez])
AC_CHECK_PROG([SETFILE],[SetFile],[SetFile])

AM_CONDITIONAL([WITH_REZ_SETFILE],[test -n "$REZ" && test -n "$SETFILE"])

iconsrootdir='${prefix}/Library/Icons'
AC_SUBST([iconsrootdir])

AC_CONFIG_FILES([
Makefile
Cube/Makefile
])

AC_OUTPUT
