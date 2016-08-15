# $MidnightBSD$

PORTNAME=	gtk
PORTVERSION=	2.24.0
PORTREVISION=	1
CATEGORIES=	x11-toolkits python
MASTER_SITES=	GNOME
MASTER_SITE_SUBDIR=	sources/pygtk/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	2
DISTNAME=	pygtk-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Set of Python bindings for GTK+

LICENSE=	gpl2

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/cairo/__init__.py:${PORTSDIR}/graphics/py-cairo
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/cairo/__init__.py:${PORTSDIR}/graphics/py-cairo

USES=		gettext gmake libtool pathfix pkgconfig tar:bzip2
USE_GNOME=	libglade2 pygobject
USE_PYTHON=	2
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PYTHON="${PYTHON_VERSION}"
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CONFIGURE_ARGS=	--disable-docs

DOCSDIR=	${PREFIX}/share/doc/py-gtk
EG_SRC_DIR=	${WRKSRC}/examples
EXAMPLESDIR=	${PREFIX}/share/examples/py-gtk

CONFLICTS=	py*-gtk-0*

OPTIONS_DEFINE=	NUMPY DOCS EXAMPLES
NUMPY_DESC=	Numpy support (pulls in lang/gcc)

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MNUMPY}
BUILD_DEPENDS+=	${PYNUMPY}
RUN_DEPENDS+=	${PYNUMPY}
CONFIGURE_ARGS+=--enable-numpy
.else
CONFIGURE_ARGS+=--disable-numpy
.endif

#
# Use the same way as the Python port to determine if we want
# threading support.
#
.if !defined(WITHOUT_THREADS)
CONFIGURE_ARGS+=	--enable-thread
CFLAGS+=		${PTHREAD_CFLAGS}
LDFLAGS+=		${PTHREAD_LIBS}
.else
CONFIGURE_ARGS+=	--disable-thread
.endif

post-install:
.if ${PORT_OPTIONS:MEXAMPLES}
	@${RM} ${WRKSRC}/examples/pygtk-demo/pygtk-demo.in
	${MKDIR} ${EXAMPLESDIR}
	cd ${EG_SRC_DIR} && ${COPYTREE_SHARE} . ${EXAMPLESDIR}
.endif
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/MAPPING ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/THREADS ${DOCSDIR}
.endif
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/gtk-2.0/gtk/*.so
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/gtk-2.0/*.so

.include <bsd.port.mk>
