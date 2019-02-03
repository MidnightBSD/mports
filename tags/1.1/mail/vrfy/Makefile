# $MidnightBSD$

PORTNAME=	vrfy
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://jadawin.tuxaco.net/freebsd/
DISTNAME=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verify mail address

LICENSE=	bsd2

WRKSRC=		${WRKDIR}
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}" RES=""
PLIST_FILES=	bin/vrfy man/man1/vrfy.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKDIR}/vrfy ${PREFIX}/bin
	${INSTALL_MAN} ${WRKDIR}/vrfy.1 ${PREFIX}/man/man1/

.include <bsd.port.mk>
