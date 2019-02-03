# New ports collection makefile for:	whatmask
# Date created:			May 20, 2001
# Whom:				ijliao
#
# $FreeBSD: ports/net-mgmt/whatmask/Makefile,v 1.8 2004/02/23 04:42:12 wollman Exp $
# $MidnightBSD$
#

PORTNAME=	whatmask
PORTVERSION=	1.2
CATEGORIES=	net-mgmt
MASTER_SITES=	http://downloads.laffeycomputer.com/current_builds/whatmask/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easily convert between three common subnet mask notations
LICENSE=	gpl2

GNU_CONFIGURE=	yes

DOCS=		AUTHORS ChangeLog README

OPTIONS_DEFINE=	DOCS

post-install:
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}

.include <bsd.port.mk>
