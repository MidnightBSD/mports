# $MidnightBSD: mports/x11-fonts/xorg-fonts-100dpi/Makefile,v 1.4 2008/04/14 18:32:27 laffer1 Exp $

PORTNAME=	xorg-fonts-100dpi
PORTVERSION=	7.4
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org 100dpi bitmap fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/100dpi/courB08.pcf.gz:${PORTSDIR}/x11-fonts/font-adobe-100dpi \
		${FONTDIR}/100dpi/UTBI__10.pcf.gz:${PORTSDIR}/x11-fonts/font-adobe-utopia-100dpi \
		${FONTDIR}/100dpi/luBIS08.pcf.gz:${PORTSDIR}/x11-fonts/font-bh-100dpi \
		${FONTDIR}/100dpi/lutBS08.pcf.gz:${PORTSDIR}/x11-fonts/font-bh-lucidatypewriter-100dpi \
		${FONTDIR}/100dpi/charB08.pcf.gz:${PORTSDIR}/x11-fonts/font-bitstream-100dpi \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings

CONFLICTS=	XFree86-font100dpi-*

NO_BUILD=	# none
FONTDIR=	${LOCALBASE}/lib/X11/fonts

do-install:	# empty

.include <bsd.port.mk>
