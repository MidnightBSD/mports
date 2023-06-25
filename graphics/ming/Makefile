PORTNAME=	ming
DISTVERSIONPREFIX=	${PORTNAME}-
DISTVERSION=	0_4_8
PORTREVISION=	3
CATEGORIES=	graphics

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Flash 4/5 movie output library with many languages support
WWW=		http://www.libming.org/

LICENSE=	gpl2 lgpl2.1
LICENSE_COMB=	multi
LICENSE_FILE_gpl2=	${WRKSRC}/LICENSE_GPL2
LICENSE_FILE_lgpl2.1=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libfreetype.so:print/freetype2 \
		libgif.so:graphics/giflib \
		libpng.so:graphics/png

CONFLICTS_INSTALL=	ja-ming-[0-9]*

OPTIONS_DEFINE=	DOCS

PORTSCOUT=	limit:^ming-

CFLAGS+=	-fcommon # https://github.com/libming/libming/issues/55
CONFIGURE_ARGS=	--includedir=${PREFIX}/include/ming
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
MAKE_JOBS_UNSAFE=	yes
PATHFIX_MAKEFILEIN=	Makefile.am
USE_LDCONFIG=	yes
USES=		autoreconf bison cpe gmake libtool localbase pathfix pkgconfig shebangfix

PORTDOCS=	*

USE_GITHUB=	yes
GH_ACCOUNT=	libming
GH_PROJECT=	libming

CPE_VENDOR=	libming

SHEBANG_FILES=	util/cws2fws

post-install:
	${MKDIR} ${PREFIX}/include/ming/ ${PREFIX}/include/ming/blocks/ ${PREFIX}/include/ming/util/
	cd ${WRKSRC}/util/ && ${INSTALL_SCRIPT} cws2fws ming-config ${PREFIX}/bin/
	cd ${WRKSRC}/ && ${INSTALL_DATA} *.h src/*.h ${PREFIX}/include/ming/
	cd ${WRKSRC}/src/blocks/ && ${INSTALL_DATA} *.h ${PREFIX}/include/ming/blocks/
	cd ${WRKSRC}/util/ && ${INSTALL_DATA} *.h ${PREFIX}/include/ming/util/

post-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}/ ${FAKE_DESTDIR}${DOCSDIR}/util/
	cd ${WRKSRC}/ && ${INSTALL_DATA} HISTORY NEWS README TODO ${FAKE_DESTDIR}${DOCSDIR}/
	cd ${WRKSRC}/util/ && ${INSTALL_DATA} README TIPS TODO swftoperl.html ${FAKE_DESTDIR}${DOCSDIR}/util/

.include <bsd.port.mk>
