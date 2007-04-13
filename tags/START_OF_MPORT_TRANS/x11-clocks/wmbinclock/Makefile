# New ports collection makefile for:	wmBinClock
# Date created:			28 September 2006
# Whom:				wintellect@bsdnexus.com
#
# $MidnightBSD$
#

PORTNAME=	wmbinclock
PORTVERSION=	0.5
CATEGORIES=	x11-clocks windowmaker
#MASTER_SITES=	http://download.sourceforge.net/wmbinclock/
MASTER_SITES=	http://easynews.dl.sourceforge.net/sourceforge/wmbinclock/

MAINTAINER=	wintellect@bsdnexus.com
COMMENT=	A binary clock in a windowmaker applet

EXTRACT_SUFX=	.tar.bz2

PLIST_FILES=	bin/wmBinClock
USE_GMAKE=	yes
USE_XPM=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmBinClock ${PREFIX}/bin

.include <bsd.port.mk>
