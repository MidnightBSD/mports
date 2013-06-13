# $MidnightBSD: mports/x11-fonts/xorg-fonts-75dpi/Makefile,v 1.6 2011/05/08 01:24:37 laffer1 Exp $

PORTNAME=	xorg-fonts-75dpi
PORTVERSION=	7.7
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org 75dpi bitmap fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/75dpi/courB08.pcf.gz:${PORTSDIR}/x11-fonts/font-adobe-75dpi \
		${FONTDIR}/75dpi/UTBI__10.pcf.gz:${PORTSDIR}/x11-fonts/font-adobe-utopia-75dpi \
		${FONTDIR}/75dpi/luBIS08.pcf.gz:${PORTSDIR}/x11-fonts/font-bh-75dpi \
		${FONTDIR}/75dpi/lutBS08.pcf.gz:${PORTSDIR}/x11-fonts/font-bh-lucidatypewriter-75dpi \
		${FONTDIR}/75dpi/charB08.pcf.gz:${PORTSDIR}/x11-fonts/font-bitstream-75dpi \
		${FONTDIR}/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings

CONFLICTS=	XFree86-font75dpi-*

NO_BUILD=	# none
FONTDIR=	${LOCALBASE}/lib/X11/fonts

do-install:	# empty

.include <bsd.port.mk>
