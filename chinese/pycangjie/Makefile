PORTNAME=	pycangjie
PORTVERSION=	1.3
DISTVERSIONPREFIX=	v
CATEGORIES=	chinese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper to libcangjie
WWW=		https://cangjians.github.io/projects/pycangjie/

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libcangjie.so:chinese/libcangjie

USES=		autoreconf gmake libtool pkgconfig sqlite python
USE_PYTHON=	cython
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CYTHON=${LOCALBASE}/bin/cython-${PYTHON_VER}
USE_GITHUB=	yes
GH_ACCOUNT=	Cangjians

post-install:
	(cd ${STAGEDIR}${PREFIX} \
  	&& ${PYTHON_CMD} ${PYTHON_LIBDIR}/*.py \
   	-d ${PREFIX} -f ${PYTHONPREFIX_SITELIBDIR:S;${PREFIX}/;;})
	@(${STRIP_CMD} ${STAGEDIR}${PREFIX}/lib/${PYTHON_VERSION}/site-packages/cangjie/*.so)

.include <bsd.port.mk>
