# $MidnightBSD$

PORTNAME=	mm
PORTVERSION=	1.4.2
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	OSSP/lib/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared memory allocation library for pre-forked process models

LICENSE=	bsd4
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

post-build:
	@${ECHO_MSG} "===>  Use 'make test' to run a quick test suite."

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libmm.so

test:
	@cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
