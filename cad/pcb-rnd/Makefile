PORTNAME=	pcb-rnd
DISTVERSION=	3.1.7b
PORTREVISION=	2
CATEGORIES=	cad
MASTER_SITES=	http://www.repo.hu/projects/${PORTNAME}/releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flexible, modular Printed Circuit Board editor
WWW=		http://www.repo.hu/projects/pcb-rnd/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libfungw.so:devel/fungw \
		libgd.so:graphics/gd \
		libgenht.so:devel/genht \
		librnd-hid.so:cad/librnd

USES=		gmake gnome pkgconfig tar:bz2
USE_GNOME=	libxml2

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	${WITH_DEBUG:D--debug} \
		--CC=${CC} \
		--cflags/libs/sul/freetype2="-I${LOCALBASE}/include/freetype2 -I${LOCALBASE}/include/freetype2/freetype" \
		--CFLAGS='${CFLAGS}' \
		--ldflags/libs/sul/freetype2=-L${LOCALBASE}/lib \
		--LDFLAGS='${LDFLAGS}'

TEST_TARGET=	test

TESTING_UNSAFE=	yes # ld: error: unable to find library -lrnd-3rd

BINARY_ALIAS=	make=${MAKE_CMD}

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install:
.for f in bxl2txt gsch2pcb-rnd pcb-rnd rect-union-rnd txt2bxl
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/bin/$f
.endfor
	${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/lib/pcb-rnd/plugins/*.so

post-install-DOCS-off:
	${RM} -r ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
