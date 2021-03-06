
dnl  Copyright 2005 Red Hat, Inc.
dnl 
dnl  Permission to use, copy, modify, distribute, and sell this software and its
dnl  documentation for any purpose is hereby granted without fee, provided that
dnl  the above copyright notice appear in all copies and that both that
dnl  copyright notice and this permission notice appear in supporting
dnl  documentation, and that the name of Red Hat not be used in
dnl  advertising or publicity pertaining to distribution of the software without
dnl  specific, written prior permission.  Red Hat makes no
dnl  representations about the suitability of this software for any purpose.  It
dnl  is provided "as is" without express or implied warranty.
dnl 
dnl  RED HAT DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
dnl  INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO
dnl  EVENT SHALL RED HAT BE LIABLE FOR ANY SPECIAL, INDIRECT OR
dnl  CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
dnl  DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
dnl  TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
dnl  PERFORMANCE OF THIS SOFTWARE.
dnl
dnl Process this file with autoconf to create configure.

AC_PREREQ([2.60])
AC_INIT([xwininfo], [1.1.1],
	[https://bugs.freedesktop.org/enter_bug.cgi?product=xorg], [xwininfo])
AM_INIT_AUTOMAKE([foreign dist-bzip2])
AM_MAINTAINER_MODE

# Require X.Org macros 1.8 or later for MAN_SUBSTS set by XORG_MANPAGE_SECTIONS
m4_ifndef([XORG_MACROS_VERSION],
	  [m4_fatal([must install xorg-macros 1.8 or later before running autoconf/autogen])])
XORG_MACROS_VERSION(1.8)

AM_CONFIG_HEADER(config.h)

AC_USE_SYSTEM_EXTENSIONS

XORG_DEFAULT_OPTIONS

AC_CHECK_FUNCS([strlcat])

AC_FUNC_STRNLEN
if test "x$ac_cv_func_strnlen_working" = xyes; then
  AC_DEFINE(HAVE_STRNLEN, 1, [Define to 1 if you have a working strnlen function.])
fi

# Check for iconv in libc, then libiconv
AC_SEARCH_LIBS([iconv], [iconv], [AC_DEFINE([HAVE_ICONV], 1,
	[Define to 1 if you have the iconv() function])])

# Allow using xcb-icccm, but don't make it the default while the API is
# still being changed.
AC_MSG_CHECKING([whether to use xcb-icccm library])
AC_ARG_WITH([xcb-icccm],
	    [AS_HELP_STRING([--with-xcb-icccm],
			    [use xcb-icccm (default: no)])],
            [], [with_xcb_icccm=no])
AC_MSG_RESULT([$with_xcb_icccm])
if test "x$with_xcb_icccm" != xno ; then
	AC_DEFINE([USE_XCB_ICCCM], 1,
		  [Define to 1 to call xcb-icccm library functions instead of local replacements])
	xcb_icccm_pc="xcb-icccm"
fi

# Checks for pkg-config packages
PKG_CHECK_MODULES(XWININFO, [xcb >= 1.6] xcb-shape ${xcb_icccm_pc})

# Even when using xcb, xproto is still required for Xfuncproto.h
# and libX11 headers for cursorfont.h
PKG_CHECK_MODULES(XLIB, x11 [xproto >= 7.0.17])
XWININFO_CFLAGS="${XWININFO_CFLAGS} ${XLIB_CFLAGS}"

AC_OUTPUT([Makefile])
