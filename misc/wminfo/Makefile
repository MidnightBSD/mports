# New ports collection makefile for:    wminfo
# Date created:         09 February 2004
# Whom:                 Thomas Kempka <t.kempka@web.de>
#
# $MidnightBSD: mports/misc/wminfo/Makefile,v 1.3 2009/04/05 19:32:35 laffer1 Exp $
# $FreeBSD: ports/misc/wminfo/Makefile,v 1.3 2006/05/10 22:37:25 edwin Exp $
#

PORTNAME=	wminfo
PORTVERSION=	1.51
PORTREVISION=   1
CATEGORIES=	misc windowmaker
MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	pav

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dockapp to run shell scripts and display the output
LICENSE=        gpl2
WRKSRC=		${WRKDIR}/${PORTNAME}/${PORTNAME}

USE_XLIB=	yes
USE_XPM=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|$$(LIBS)$$|& $$(OBJS)|g' \
		-e 's|/usr/X11R6|$$(X11BASE)|g' \
		-e 's|/share/include|/include|g' \
		${WRKSRC}/Makefile

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/wminfo ${PREFIX}/bin

.include <bsd.port.mk>
