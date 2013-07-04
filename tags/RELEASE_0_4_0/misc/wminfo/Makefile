# New ports collection makefile for:    wminfo
# Date created:         09 February 2004
# Whom:                 Thomas Kempka <t.kempka@web.de>
#
# $MidnightBSD: mports/misc/wminfo/Makefile,v 1.4 2009/05/27 21:01:20 crash Exp $
# $FreeBSD: ports/misc/wminfo/Makefile,v 1.3 2006/05/10 22:37:25 edwin Exp $
#

PORTNAME=	wminfo
PORTVERSION=	1.51
PORTREVISION=   2
CATEGORIES=	misc windowmaker
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	pav

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dockapp to run shell scripts and display the output
LICENSE=        gpl2
WRKSRC=		${WRKDIR}/${PORTNAME}/${PORTNAME}

USE_XLIB=	yes
USE_XORG=	xpm

post-patch:
	@${REINPLACE_CMD} -e 's|$$(LIBS)$$|& $$(OBJS)|g' \
		-e 's|/usr/X11R6|$$(LOCALBASE)|g' \
		-e 's|/share/include|/include|g' \
		${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wminfo ${PREFIX}/bin

.include <bsd.port.mk>
