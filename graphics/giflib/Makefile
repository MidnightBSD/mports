PORTNAME=	giflib
PORTVERSION=	5.2.2
CATEGORIES=	graphics
MASTER_SITES=	SF/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tools and library routines for working with GIF images
WWW=		https://sourceforge.net/projects/giflib/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	ghead:sysutils/coreutils

USES=		cpe gmake
CPE_VENDOR=	giflib_project
USE_LDCONFIG=	yes

MAKE_ARGS=	CC=${CC} \
		LDFLAGS="${LDFLAGS}" \
		OFLAGS="${CFLAGS}" \
		PREFIX="${PREFIX}"
TEST_TARGET=	check

CFLAGS+=	-DHAVE_REALLOCARRAY

CONFLICTS_INSTALL=	giftool

OPTIONS_DEFINE=	DOCS

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DOCSDIR} \
		"! ( -name Makefile -o -name *\.[17] -o -name *\.xml )"
	${MV} ${FAKE_DESTDIR}${DOCSDIR}/index.html.in ${FAKE_DESTDIR}${DOCSDIR}/index.html

pre-build:
	${CP} ${FILESDIR}/giflib-logo.gif ${WRKSRC}/doc

post-install:
	${STRIP_CMD} ${PREFIX}/bin/*
	${STRIP_CMD} --strip-unneeded ${PREFIX}/lib/libgif.so.7.2.0

.include <bsd.port.mk>
