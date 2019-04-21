# $MidnightBSD$
# $FreeBSD: head/graphics/graphene/Makefile 461838 2018-02-14 21:15:32Z pi $

PORTNAME=	graphene
PORTVERSION=	1.8.2
CATEGORIES=	graphics devel
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Optimizations for speeding up vector operations

LICENSE=	mit

BUILD_DEPENDS+=	python2.7:lang/python27

USES=		gnome meson pkgconfig python:3.4+ shebangfix tar:xz
USE_GNOME=	glib20 pygobject3
USE_LDCONFIG=	yes

OPTIONS_SUB=	yes
OPTIONS_DEFINE=	GTKDOC #INTROSPECTION
#OPTIONS_DEFAULT=INTROSPECTION

SHEBANG_FILES=	src/identfilter.py

USE_GCC=	yes

USE_GNOME+=		introspection:build
#INTROSPECTION_DESC=	Build Gobject Introspection
#INTROSPECTION_USE=	gnome=introspection:build
#INTROSPECTION_MESON_OFF=	-Denable-introspection=false

GTKDOC_MESON_TRUE=	gtk_doc
GTKDOC_DESC=		Build documentation
GTKDOC_BUILD_DEPENDS=	gtk-doc>0:textproc/gtk-doc

post-patch:
	@${REINPLACE_CMD} -e 's|=python |=${PYTHON_VERSION} |g' \
		${WRKSRC}/src/meson.build

# We don't want install tests
post-install:
	@${RM} -rf ${STAGEDIR}${PREFIX}/libexec/installed-tests
	@${RM} -rf ${STAGEDIR}${PREFIX}/share/installed-tests
	${CP} ${PREFIX}/lib/pkgconfig/*.pc ${PREFIX}/libdata/pkgconfig

.include <bsd.port.mk>
