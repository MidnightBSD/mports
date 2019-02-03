# $MidnightBSD$

PORTNAME=	uuid
PORTVERSION=	1.6.2
CATEGORIES=	misc devel
MASTER_SITES=	${MASTER_SITE_OSSP}
MASTER_SITE_SUBDIR=	lib/${PORTNAME}
PKGNAMEPREFIX=	ossp-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ISO-C API and CLI for generating Universally Unique Identifiers

LICENSE=	mit

GNU_CONFIGURE=	yes
USES+=		libtool pathfix
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-cxx \
		--includedir=${PREFIX}/include/ossp

.if defined(SLAVEPORT) && ${SLAVEPORT}=="perl"
PKGNAMEPREFIX=	p5-OSSP-
.else
CONFLICTS=	e2fsprogs-libuuid-[0-9]*
.endif

regression-test: test

test: build
	@(cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_FLAGS} \
		${MAKEFILE} ${MAKE_ARGS} check)

.include <bsd.port.mk>
