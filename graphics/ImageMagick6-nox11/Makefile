# Created by: mm@FreeBSD.org
# $FreeBSD: head/graphics/ImageMagick-nox11/Makefile 420009 2016-08-10 12:08:05Z kwm $
# $MidnightBSD$

PORTREVISION=	1

# the SVG and PANGO plugins need X11
OPTIONS_EXCLUDE=	X11 SVG PANGO
PORTSCOUT=	ignore:1
# workaround until bsd.port.mk code can grok the disabling of the X11 option
WITHOUT_X11=yes

MASTERDIR=	${.CURDIR}/../ImageMagick6

.include        "${MASTERDIR}/Makefile"
