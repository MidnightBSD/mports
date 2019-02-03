# $MidnightBSD$

PORTNAME=	lscpu
PORTVERSION=	1.0.0
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Display information about the CPU architecture

LICENSE=	bsd3

USE_GITHUB=	yes
GH_ACCOUNT=	NanXiao

USE_GCC=	yes

PLIST_FILES=	bin/${PORTNAME} man/man1/${PORTNAME}.1.gz

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.1 ${MANPREFIX}/man/man1/${PORTNAME}.1

.include <bsd.port.mk>
