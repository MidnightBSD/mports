PORTNAME=	gobject-introspection
DISTVERSION=	1.84.0
PORTREVISION=	1
PORTEPOCH=	1
CATEGORIES=	devel
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate interface introspection data for GObject libraries
WWW=		https://gi.readthedocs.io/en/latest/

LICENSE=	gpl2 lgpl
LICENSE_COMB=	multi

LIB_DEPENDS=	libffi.so:devel/libffi

FLAVORS=	default bootstrap
FLAVOR?=	${FLAVORS:[1]}

#PKGCONFIG_BASE=	yes

MAKE_ENV+= LD_LIBRARY_PATH=${LOCALBASE}/glib-bootstrap/lib

default_LIB_DEPENDS=	libglib-2.0.so:devel/glib20

bootstrap_PKGNAMESUFFIX=	-bootstrap
bootstrap_BUILD_DEPENDS=	${LOCALBASE}/glib-bootstrap/lib/libglib-2.0.so:devel/glib20@bootstrap
bootstrap_RUN_DEPENDS=		${LOCALBASE}/glib-bootstrap/lib/libglib-2.0.so:devel/glib20@bootstrap

#LDFLAGS+= -lc_nonshared
LDFLAGS+= -L/usr/local/glib-bootstrap/lib -L/usr/local/lib

USES=		bison gettext localbase:ldflags meson pkgconfig python tar:xz
BINARY_ALIAS=  python3=${PYTHON_CMD}
USE_LDCONFIG=	yes
MESON_ARGS=	-Ddoctool=disabled \
		-Dpython=${PYTHON_CMD} \
		-Dglib:xattr=false -Dglib:tests=false \
		-Dglib:dtrace=disabled -Dglib:systemtap=disabled \
		-Dglib:sysprof=disabled \
		-Dglib:c_link_args="-lc_nonshared"
CFLAGS+=	-D__BSD_VISIBLE=1  -L${LOCALBASE}/glib-bootstrap/lib
#-lc_nonshared -I/usr/local/include/python3.11/
PORTSCOUT=	limitw:1,even

OPTIONS_DEFINE=	TEST

TEST_MESON_ENABLED=	cairo
TEST_LIB_DEPENDS=	libcairo.so:graphics/cairo

.if ${FLAVOR:U} == bootstrap
PKG_CONFIG_PATH=/usr/local/glib-bootstrap/libdata/pkgconfig
MESON_ARGS+=	-Dcairo=disabled 
OPTIONS_DEFINE=
PREFIX=		${LOCALBASE}/${PORTNAME}-bootstrap
PLIST_FILES+=	/usr/local/libdata/ldconfig/gobject-introspection-bootstrap
.endif

.include <bsd.port.pre.mk>

.if ${PYTHON_REL} >= 31200
BUILD_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR}
.endif

.if ${FLAVOR:U} == bootstrap
post-extract:
#	${MKDIR} ${FAKE_DESTDIR}${LOCALBASE}/glib-bootstrap/libdata/pkgconfig
	${MKDIR} ${LOCALBASE}/glib-bootstrap/libdata/pkgconfig
	${LN} -s ${LOCALBASE}/glib-bootstrap/libdata/pkgconfig ${PKGCONFIG_LINKDIR}
#	touch ${FAKE_DESTDIR}${LOCALBASE}/glib-bootstrap/libdata/pkgconfig/gobject-introspection-bootstrap
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%PYTHON_CMD%%|${PYTHON_CMD}|' ${WRKSRC}/tools/meson.build
#	find ${WRKSRC} -iname 'meson*' -type f -exec sed -i'.orig' -e "s|'freebsd'|'midnightbsd'|g" {} \;

pre-fake:
	${MKDIR} /usr/local/gobject-introspection-bootstrap

post-fake:
	@${PYTHON_CMD} -m compileall -d ${PREFIX}/lib/${PORTNAME} \
		"${FAKE_DESTDIR}${PREFIX}/lib/${PORTNAME}"
	@${PYTHON_CMD} -O -m compileall -d ${PREFIX}/lib/${PORTNAME} \
		"${FAKE_DESTDIR}${PREFIX}/lib/${PORTNAME}"

post-install:
	@${RM} ${STAGEDIR}${PREFIX}/lib/gobject-introspection/giscanner/doctemplates/*/meson.build*
.if ${FLAVOR:U} == bootstrap
	echo "/usr/local/gobject-introspection-bootstrap/lib" >> ${FAKE_DESTDIR}/usr/local/gobject-introspection-bootstrap/libdata/ldconfig/gobject-introspection-bootstrap
.endif

.include <bsd.port.post.mk>
