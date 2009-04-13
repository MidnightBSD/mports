# New ports collection makefile for:	wmBinClock
# Date created:			28 September 2006
# Whom:				wintellect@bsdnexus.com
#
# $MidnightBSD: mports/x11-clocks/wmbinclock/Makefile,v 1.3 2007/11/06 00:25:41 laffer1 Exp $
#

PORTNAME=	wmbinclock
PORTVERSION=	0.5
PORTREVISION=	2
CATEGORIES=	x11-clocks windowmaker
MASTER_SITES=	SF

MAINTAINER=	wintellect@bsdnexus.com
COMMENT=	A binary clock in a windowmaker applet
LICENSE=	gpl2

EXTRACT_SUFX=	.tar.bz2

PLIST_FILES=	bin/wmBinClock
USE_GMAKE=	yes
USE_XPM=	yes
USE_XLIB=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmBinClock ${PREFIX}/bin

.include <bsd.port.mk>
