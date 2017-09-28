# ex:ts=8
# Ports collection makefile for:	cvsps
# Date Created:			Jan 4, 2008
# Whom:				laffer1
#
# $MidnightBSD$
#

PORTNAME=	cvsps
DISTVERSION=	2.1
CATEGORIES=	devel
MASTER_SITES=	http://www.cobite.com/cvsps/
PKGNAMESUFFIX?=	-devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CVS patchsets
LICENSE=	gpl2

CONFLICTS=	cvsps-1.*

USE_GMAKE=	yes

PLIST_FILES=	bin/cvsps man/man1/cvsps.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/cvsps ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/cvsps.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
