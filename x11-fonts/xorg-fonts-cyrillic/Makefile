# $MidnightBSD: mports/x11-fonts/xorg-fonts-cyrillic/Makefile,v 1.8 2011/05/08 01:24:38 laffer1 Exp $

PORTNAME=	xorg-fonts-cyrillic
PORTVERSION=	7.7
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org Cyrillic bitmap fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/cyrillic/crox1c.pcf.gz:${PORTSDIR}/x11-fonts/font-cronyx-cyrillic \
		${FONTDIR}/cyrillic/koi12x24.pcf.gz:${PORTSDIR}/x11-fonts/font-misc-cyrillic \
		${FONTDIR}/cyrillic/screen8x16.pcf.gz:${PORTSDIR}/x11-fonts/font-screen-cyrillic \
		${FONTDIR}/cyrillic/proof9x16.pcf.gz:${PORTSDIR}/x11-fonts/font-winitzki-cyrillic \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings

CONFLICTS=	XFree86-fontCyrillic-*

NO_BUILD=	# none
FONTDIR=	${LOCALBASE}/lib/X11/fonts

do-install:	# empty

.include <bsd.port.mk>
