# $MidnightBSD$

PORTNAME=	gnome-doc-utils
PORTVERSION=	0.20.10
PORTREVISION=	4
CATEGORIES=	textproc gnome
MASTER_SITES=	GNOME

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME doc utils

LICENSE=	gpl2

BUILD_DEPENDS=	rarian-sk-config:textproc/rarian \
		${PYTHON_SITELIBDIR}/libxml2mod.so:textproc/py-libxml2@${PY_FLAVOR}
RUN_DEPENDS=	rarian-sk-config:textproc/rarian \
		${PYTHON_SITELIBDIR}/libxml2mod.so:textproc/py-libxml2@${PY_FLAVOR} \
		docbook-xml>0:textproc/docbook-xml

USES=		gettext-tools:build,run gmake pathfix pkgconfig python:2.7 tar:xz
USE_GNOME=	libxslt intlhack
INSTALLS_OMF=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-omf-dir=${PREFIX}/share/omf
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

post-install:
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py -d ${TRUE_PREFIX} -l ${PYTHON_SITELIBDIR}/xml2po
	@${PYTHON_CMD} ${PYTHON_LIBDIR}/compileall.py -d ${TRUE_PREFIX} -l ${PYTHON_SITELIBDIR}/xml2po/modes

.include <bsd.port.mk>
