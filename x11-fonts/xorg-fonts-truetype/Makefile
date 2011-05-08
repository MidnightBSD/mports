# $MidnightBSD: mports/x11-fonts/xorg-fonts-truetype/Makefile,v 1.7 2009/06/05 00:47:11 laffer1 Exp $

PORTNAME=	xorg-fonts-truetype
PORTVERSION=	7.5.1
CATEGORIES=	x11-fonts
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org TrueType fonts
LICENSE=	agg

RUN_DEPENDS=	${FONTDIR}/TTF/luximb.ttf:${PORTSDIR}/x11-fonts/font-bh-ttf \
		${FONTDIR}/OTF/SyrCOMAdiabene.otf:${PORTSDIR}/x11-fonts/font-misc-meltho \
		${FONTDIR}/TTF/GohaTibebZemen.ttf:${PORTSDIR}/x11-fonts/font-misc-ethiopic \
		${LOCALBASE}/lib/X11/fonts/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings \
		${LOCALBASE}/lib/X11/fonts/bitstream-vera/VeraIt.ttf:${PORTSDIR}/x11-fonts/bitstream-vera

do-install:	# empty

NO_BUILD=	yes
FONTDIR=	${LOCALBASE}/lib/X11/fonts

.include <bsd.port.mk>
