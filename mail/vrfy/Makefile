# $MidnightBSD$

PORTNAME=	vrfy
PORTVERSION=	1.0
DISTVERSIONPREFIX=v
PORTREVISION=	2
CATEGORIES=	mail

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verify mail address

USE_GITHUB=	yes
GH_ACCOUNT=	asxe

MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" RES=""
PLIST_FILES=	bin/vrfy man/man1/vrfy.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/vrfy ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/vrfy.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
