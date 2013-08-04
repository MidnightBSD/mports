# $MidnightBSD: mports/net-p2p/ctorrent/Makefile,v 1.3 2009/07/05 16:20:21 laffer1 Exp $

PORTNAME=	ctorrent
PORTVERSION=    3.3.2
PORTREVISION=	1
CATEGORIES=	net-p2p
MASTER_SITES=	http://www.rahul.net/dholmes/ctorrent/
DISTNAME=	${PORTNAME}-dnh${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BitTorrent Client written in C for FreeBSD and Linux

LICENSE=        gpl2

GNU_CONFIGURE=	yes
#WRKSRC=		${WRKDIR}/${PORTNAME}-dnh${PATCHLEVEL}

PLIST_FILES=	bin/ctorrent

PORTDOCS=	README-DNH.TXT UserGuide

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/$i ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
