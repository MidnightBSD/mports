# $MidnightBSD$

PORTNAME=	userboot-freebsd
PORTVERSION=	10.0
MASTER_SITES=	http://people.midnightbsd.org/~laffer1/
CATEGORIES=	sysutils
DISTFILES=	${PORTNAME}.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FreeBSD userboot.so for bhyve

LICENSE=	bsd2

WRKSRC=		${WRKDIR}
NO_BUILD=	yes
NO_STRIP=	yes

ONLY_FOR_ARCHS=	amd64

do-install:
	${MKDIR} ${PREFIX}/lib/freebsd
	${INSTALL_LIB} ${WRKSRC}/boot/userboot.so ${PREFIX}/lib/freebsd/

.include <bsd.port.mk>
