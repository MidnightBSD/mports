# New ports collection makefile for:	wmBinClock
# Date created:			28 September 2006
# Whom:				wintellect@bsdnexus.com
#
# $MidnightBSD$
#

PORTNAME=	wmbinclock
PORTVERSION=	0.51
CATEGORIES=	x11-clocks windowmaker

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Binary clock in a windowmaker applet

LICENSE=	gpl2 bsd3
LICENSE_COMB=	dual

USE_GITHUB=	yes
GH_ACCOUNT=	engerim42

PLIST_FILES=	bin/wmBinClock

USES=		gmake
USE_XORG=	xpm x11

post-patch:
	@${REINPLACE_CMD} -e 's|#include <values.h>||' ${WRKSRC}/wmBinClock.c
	@${REINPLACE_CMD} -e 's|^CC.*=|CC ?=|' -e 's|^CFLAGS.*=|CFLAGS +=|' \
		-e 's|/usr/X11R6|${LOCALBASE}|g' ${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wmBinClock ${PREFIX}/bin

.include <bsd.port.mk>
