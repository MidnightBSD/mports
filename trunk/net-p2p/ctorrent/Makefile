# $MidnightBSD: mports/net-p2p/ctorrent/Makefile,v 1.2 2008/07/19 09:20:58 crash Exp $

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

PORTDOCS=	README-DNH.TXT UserGuide

.if !defined(NOPORTDOCS)
post-install:
	${MKDIR} ${DOCSDIR}
.for i in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/$i ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
