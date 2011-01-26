# New ports collection makefile for:   flowd
# Date created:        9 October 2004
# Whom:                Janos Mohacsi <janos.mohacsi@bsd.hu>
#
# $FreeBSD: ports/net-mgmt/softflowd/Makefile,v 1.2 2005/01/25 19:05:57 arved Exp $
# $MidnightBSD: mports/net-mgmt/softflowd/Makefile,v 1.1 2006/12/27 02:48:19 laffer1 Exp $
#

PORTNAME=	softflowd
PORTVERSION=	0.9.7
CATEGORIES=	net-mgmt ipv6
MASTER_SITES=	http://www2.mindrot.org/files/softflowd/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Softflowd is flow-based network traffic analyser with export
LICENSE=	bsd2

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
PLIST_FILES=	sbin/softflowd sbin/softflowctl
MAN8=		softflowd.8 softflowctl.8
PORTDOCS=	README

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTDOCS} ${DOCSDIR}
.endif

.include <bsd.port.mk>
