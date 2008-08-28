# New ports collection makefile for:    xorg-fonts-100dpi
# Date created:		30 May 2004
# Whom:			anholt@FreeBSD.org
#
# $FreeBSD: ports/x11-fonts/xorg-fonts-100dpi/Makefile,v 1.11 2007/09/13 19:44:52 flz Exp $
# $MidnightBSD: mports/x11-fonts/xorg-fonts-100dpi/Makefile,v 1.3 2007/10/09 15:48:29 ctriv Exp $
#

PORTNAME=	xorg-fonts-100dpi
PORTVERSION=	7.3
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
FONTDIR=	${X11BASE}/lib/X11/fonts

do-install:	# empty

.include <bsd.port.mk>
