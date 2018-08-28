# $MidnightBSD$

PORTNAME=	mm
PORTVERSION=	1.4.2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_OSSP}
MASTER_SITE_SUBDIR=	lib/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Shared memory allocation library for pre-forked process models
LICENSE=	bsd4

USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes

post-build:
	@${ECHO_MSG} "===>  Use 'make test' to run a quick test suite."

test:
	@cd ${WRKSRC} && ${MAKE} test

.include <bsd.port.mk>
