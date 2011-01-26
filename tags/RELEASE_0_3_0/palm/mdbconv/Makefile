# $MidnightBSD: mports/palm/mdbconv/Makefile,v 1.2 2009/04/08 21:05:50 laffer1 Exp $
#

PORTNAME=	mdbconv
PORTVERSION=	1.6
CATEGORIES=	palm databases
MASTER_SITES=	http://www.handmark.com/downloads/
DISTNAME=	${PORTNAME}freebsd3x

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts CSV to MobileDB database
LICENSE=	unknown

NO_WRKSUBDIR=	yes
PLIST_FILES=	bin/mdbconv

pre-build:
	${CP} ${FILESDIR}/Makefile ${WRKSRC}
	${RM} ${WRKSRC}/mdbconv

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/mdbconv ${PREFIX}/bin

.include <bsd.port.mk>
