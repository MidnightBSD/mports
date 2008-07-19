# New ports collection makefile for:	ctorrent
# Date created:				Jan 17 2004
# Whom:					Florent Thoumie <flz@xbsd.org>
#
# $MidnightBSD: mports/net-p2p/ctorrent/Makefile,v 1.1 2007/06/08 14:13:07 laffer1 Exp $
# $FreeBSD: ports/net-p2p/ctorrent/Makefile,v 1.14 2007/01/09 02:31:24 flz Exp $
#

PORTNAME=	ctorrent
PORTVERSION=    3.3.2
CATEGORIES=	net-p2p
MASTER_SITES=	http://www.rahul.net/dholmes/ctorrent/
DISTNAME=	${PORTNAME}-dnh${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BitTorrent Client written in C for FreeBSD and Linux
LICENSE=        gpl2
GNU_CONFIGURE=	yes
#WRKSRC=		${WRKDIR}/${PORTNAME}-dnh${PATCHLEVEL}

PLIST_FILES=	bin/ctorrent
CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0

PORTDOCS=	README-DNH.TXT

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/$i ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
