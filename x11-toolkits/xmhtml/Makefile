PORTNAME=	XmHTML
PORTVERSION=	1.1.10
PORTREVISION=	1
CATEGORIES=	x11-toolkits www
MASTER_SITES=	SF/${PORTNAME:tl}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Motif widget set for displaying HTML 3.2 documents
WWW=		https://sourceforge.net/projects/xmhtml/

LICENSE=	lgpl+
LICENSE_FILE=	${WRKSRC}/COPYING.LIB

LIB_DEPENDS=	libpng.so:graphics/png

USES=		gmake jpeg libtool:build motif pkgconfig tar:tgz xorg
USE_XORG=	xft xmu xpm xt
USE_LDCONFIG=	yes

LIBTOOL=	libtool
MAKE_ENV=	LIBTOOL=${LIBTOOL}

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	(cd ${WRKSRC}/lib && ${LIBTOOL} --mode=install ${INSTALL_DATA} \
		libXmHTML.la ${STAGEDIR}${PREFIX}/lib)
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/libXmHTML.so
	@${MKDIR} ${STAGEDIR}${PREFIX}/include/XmHTML
	${INSTALL_DATA} ${WRKSRC}/include/XmHTML/*.h \
		${STAGEDIR}${PREFIX}/include/XmHTML

do-install-DOCS-on:
	${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	(cd ${WRKSRC}/html && ${COPYTREE_SHARE} . \
		${FAKE_DESTDIR}${DOCSDIR})

do-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	cd ${WRKSRC} && ${COPYTREE_SHARE} "book contrib examples" \
		${FAKE_DESTDIR}${EXAMPLESDIR} "! -name Makefile"

.include <bsd.port.mk>
