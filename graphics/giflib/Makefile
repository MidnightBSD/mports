PORTNAME=	giflib
PORTVERSION=	5.2.1
PORTREVISION=	1
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library routines for working with GIF images
WWW=		https://sourceforge.net/projects/giflib/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	ghead:sysutils/coreutils

USES=		cpe gmake
USE_LDCONFIG=	yes
CFLAGS+=	-DHAVE_REALLOCARRAY
MAKE_ARGS=	CC=${CC} LDFLAGS="${LDFLAGS}" OFLAGS="${CFLAGS}" PREFIX="${PREFIX}"
CPE_VENDOR=	giflib_project

CONFLICTS_INSTALL=	giftool

OPTIONS_DEFINE=	DOCS
TEST_TARGET=	check

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} "! ( -name Makefile -o -name *\.1 -o -name *\.in -o -name *\.xml )"

post-install:
	${STRIP_CMD} ${PREFIX}/bin/*
	${STRIP_CMD} --strip-unneeded ${PREFIX}/lib/libgif.so.7.2.0

.include <bsd.port.mk>
