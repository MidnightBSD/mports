PORTNAME=	giflib
PORTVERSION=	5.1.9
PORTREVISION=	0
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library routines for working with GIF images

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	ghead:sysutils/coreutils

USES=		gmake
USE_LDCONFIG=	yes
CFLAGS+=	-DHAVE_REALLOCARRAY
MAKE_ARGS=	CC=${CC} LDFLAGS="${LDFLAGS}" MANDIR=${MANPREFIX}/man OFLAGS="${CFLAGS}" PREFIX="${PREFIX}"

OPTIONS_DEFINE=	DOCS
TEST_TARGET=	check

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! ( -name Makefile -o -name *\.1 -o -name *\.in -o -name *\.xml )"

post-install:
	${STRIP_CMD} ${PREFIX}/bin/*
	${STRIP_CMD} --strip-unneeded ${PREFIX}/lib/libgif.so.7.1.0

.include <bsd.port.mk>
