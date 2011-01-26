# New ports collection makefile for:	giFT-FastTrack
# Date created:		2003-09-04
# Whom:			Stefan Ehmann <shoesoft@gmx.net>
#
# $MidnightBSD: mports/net-p2p/gift-fasttrack/Makefile,v 1.2 2008/09/14 00:45:15 laffer1 Exp $
# $FreeBSD: ports/net-p2p/gift-fasttrack/Makefile,v 1.11 2007/04/03 17:33:40 jmelo Exp $
#

PORTNAME=	giFT-FastTrack
PORTVERSION=	0.8.9
CATEGORIES=	net-p2p
MASTER_SITES=	${MASTER_SITE_BERLIOS}
MASTER_SITE_SUBDIR=	gift-fasttrack

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A FastTrack plugin for giFT
LICENSE=	gpl2

LIB_DEPENDS=	gift.0:${PORTSDIR}/net-p2p/gift

USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNOME=	pkgconfig
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" \
			LDFLAGS="${LDFLAGS}"

PORTDOCS=	AUTHORS COPYING ChangeLog \
		INSTALL NEWS README TODO

post-install:
.ifndef(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
.for doc in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${doc} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
