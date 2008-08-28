# New ports collection makefile for:   pkg_search
# Date created:        3 December 2007
# Whom:                Matthias Schmidt
#
# $MidnightBSD$
# $FreeBSD: ports/ports-mgmt/pkg_search/Makefile,v 1.1 2007/12/12 18:45:15 chinsan Exp $
#

PORTNAME=	pkg_search
PORTVERSION=	1.2
CATEGORIES=	ports-mgmt
MASTER_SITES=	http://www.mathematik.uni-marburg.de/~schmidtm/pkg_search/ \
		LOCAL/chinsan

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A nifty script searching the ports database
LICENSE=	bsd2

PLIST_FILES=	bin/pkg_search

MAN1=		pkg_search.1

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${MAN1} ${PREFIX}/man/man1

.include <bsd.port.mk>
