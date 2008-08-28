# New ports collection makefile for:	wmlpq
# Date created:				Thu Jul  5 14:43:55 EDT 2001
# Whom:					Patrick Li <pat@databits.net>
#
# $MidnightBSD: mports/print/wmlpq/Makefile,v 1.1 2006/10/06 15:33:47 wintellect Exp $
# $FreeBSD: ports/print/wmlpq/Makefile,v 1.6 2006/04/14 22:53:08 linimon Exp $
#

PORTNAME=	wmlpq
PORTVERSION=	0.2.1
PORTREVISION=	2
CATEGORIES=	print windowmaker
MASTER_SITES=	http://www.ur.uklinux.net/wmlpq/dl/
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Print queue monitoring dockapp for Window Maker

LIB_DEPENDS=	dockapp.2:${PORTSDIR}/x11-wm/libdockapp

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}
USE_XLIB=	yes
USE_XPM=	yes

MAN1=		${PORTNAME}.1x

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1x ${PREFIX}/man/man1
.ifndef(NOPORTDOCS)
	@${MKDIR} ${PREFIX}/share/doc/${PORTNAME}
	@${MKDIR} ${PREFIX}/share/examples/${PORTNAME}
	@${INSTALL_DATA} ${WRKSRC}/README ${PREFIX}/share/doc/${PORTNAME}
	@${INSTALL_DATA} ${WRKSRC}/sample.wmlpqrc ${PREFIX}/share/examples/${PORTNAME}
	@${INSTALL_DATA} ${WRKSRC}/wmlpqrc ${PREFIX}/share/examples/${PORTNAME}
.endif #NOPORTDOCS
	@${SED} -e "s|/usr/X11R6|${PREFIX}|" ${PKGMESSAGE}

.include <bsd.port.mk>
