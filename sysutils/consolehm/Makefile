PORTNAME=	consolehm
PORTVERSION=	1.31
CATEGORIES=	sysutils
MASTER_SITES=	FREEBSD_LOCAL/fenner

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Console based hardware monitor for BSD

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

BROKEN_aarch64=	fails to build: fatal error: 'machine/pio.h' file not found

USES=		uidfix
GNU_CONFIGURE=	yes
WRKSRC=		${WRKDIR}/consolehm/consolehm
MAKE_ENV=	ARCH=${ARCH}

PLIST_FILES=	bin/chm man/man8/chm.8.gz

.include <bsd.port.mk>
