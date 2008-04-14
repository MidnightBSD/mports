# New ports collection makefile for:    xorg-fonts-truetype
# Date created:		30 May 2004
# Whom:			anholt@FreeBSD.org
#
# $FreeBSD: ports/x11-fonts/xorg-fonts-truetype/Makefile,v 1.11 2007/09/13 19:44:53 flz Exp $
# $MidnightBSD: mports/x11-fonts/xorg-fonts-truetype/Makefile,v 1.3 2007/10/11 19:21:57 ctriv Exp $
#

PORTNAME=	xorg-fonts-truetype
PORTVERSION=	7.3
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
		${X11BASE}/lib/X11/fonts/encodings/encodings.dir:${PORTSDIR}/x11-fonts/encodings \
		${X11BASE}/lib/X11/fonts/bitstream-vera/VeraIt.ttf:${PORTSDIR}/x11-fonts/bitstream-vera \

do-install:	# empty

NO_BUILD=	# none
FONTDIR=	${X11BASE}/lib/X11/fonts

.include <bsd.port.mk>
