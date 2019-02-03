# $MidnightBSD$
# $FreeBSD: ports/graphics/liblqr-1/Makefile,v 1.13 2011/11/09 15:25:34 miwi Exp $

PORTNAME=	liblqr-1
DISTVERSION=	0.4.1
PORTREVISION=	3
CATEGORIES=	graphics
MASTER_SITES=	http://liblqr.wdfiles.com/local--files/en:download-page/ \
		http://mirror.amdmi3.ru/distfiles/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Easy to use C/C++ seam carving library

LICENSE=	gpl3

GNU_CONFIGURE=	yes
USES=		tar:bzip2 gettext gmake pkgconfig libtool
USE_GNOME=	glib20
USE_LDCONFIG=	yes
INSTALL_TARGET=	install-strip

# Use GNU89 inline semantics
USE_CSTD=	gnu89

PORTEXAMPLES=	*

OPTIONS_DEFINE=	EXAMPLES HTMLDOCS
HTMLDOCS_DESC=	Build and install HTML documentation

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MEXAMPLES}
SUB_FILES=	pkg-message
SUB_LIST=	PORTSDIR=${PORTSDIR}
.endif

.if ${PORT_OPTIONS:MHTMLDOCS}
BUILD_DEPENDS+=	${LOCALBASE}/bin/xsltproc:${PORTSDIR}/textproc/libxslt \
		${LOCALBASE}/share/xsl/docbook/xhtml/chunk.xsl:${PORTSDIR}/textproc/docbook-xsl \
		${LOCALBASE}/share/xml/docbook/4.5:${PORTSDIR}/textproc/docbook-xml
PLIST_SUB=	HTMLDOCS=""
.else
PLIST_SUB=	HTMLDOCS="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^lqr_pkgconfigdir/ s|$$(libdir)|$${exec_prefix}/libdata|' \
		${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr.*chunk\.xsl|${LOCALBASE}/share/xsl/docbook/html/chunk.xsl|' \
		${WRKSRC}/docs/lqr_style.xsl
	@${REINPLACE_CMD} -e 's|/usr.*docbookx.dtd|${LOCALBASE}/share/xml/docbook/4.5/docbookx.dtd|' \
		${WRKSRC}/docs/liblqr_manual.docbook

.if ${PORT_OPTIONS:MHTMLDOCS}
post-build:
	cd ${WRKSRC}/docs && ${SETENV} ${MAKE_ENV} ${MAKE} html
.endif

post-install:
.if ${PORT_OPTIONS:MHTMLDOCS}
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/html/* ${STAGEDIR}${DOCSDIR}
.endif
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/examples/* ${STAGEDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
