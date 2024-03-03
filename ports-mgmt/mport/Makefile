PORTNAME=	mport
PORTVERSION=	2.6.0
PORTREVISION=	0
CATEGORIES=	ports-mgmt sysutils

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Package Manager for MidnightBSD
WWW=		https://github.com/midnightbsd/mport

LICENSE=	bsd2

WRKSRC=         ${WRKDIR}/${PORTNAME}-${PORTVERSION}

USE_GITHUB=     yes
GH_PROJECT=     mport
GH_ACCOUNT=     midnightbsd
GH_TAGNAME=     ${PORTVERSION}
USE_CSTD=       c99

PREFIX=	/usr

MPORT_INSTALL= 	${FAKE_DESTDIR}/usr/libexec/mport.install

.include <bsd.port.mk>
