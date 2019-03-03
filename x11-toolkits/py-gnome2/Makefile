# $MidnightBSD$

PORTNAME=	gnome
PORTVERSION=	2.28.1
PORTREVISION=	5
CATEGORIES=	x11-toolkits python gnome
MASTER_SITES=	GNOME/sources/gnome-python/${PORTVERSION:C/^([0-9]+\.[0-9]+).*/\1/}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	gnome-python-${PORTVERSION}
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python bindings for GNOME 2

LICENSE=	lgpl

OPTIONS_DEFINE=	EXAMPLES

OPTIONS_SUB=	yes

BUILD_DEPENDS=	${PYTHON_SITELIBDIR}/ORBit.so:devel/py-orbit@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_SITELIBDIR}/ORBit.so:devel/py-orbit@${PY_FLAVOR}

USES=		gettext gmake libtool:keepla pathfix pkgconfig python:2.7 tar:bzip2
USE_LDCONFIG=	yes
USE_GNOME=	libgnomeui pygtk2
USE_PYTHON=	flavors
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	PTHREAD_LIBS="-lpthread"
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip

EG_SRC_DIR=	${WRKSRC}/examples
EG_DST_DIR=	${PREFIX}/share/examples/py-gnome

post-install:
	@${MKDIR} ${STAGEDIR}${EG_DST_DIR}
	cd ${EG_SRC_DIR}; ${PAX} -rw . ${STAGEDIR}${EG_DST_DIR}
	${FIND} ${STAGEDIR}${EG_DST_DIR} -type d -print | ${XARGS} ${CHMOD} 0755
	${FIND} ${STAGEDIR}${EG_DST_DIR} -type f -print | ${XARGS} ${CHMOD} 0444

.include <bsd.port.mk>
