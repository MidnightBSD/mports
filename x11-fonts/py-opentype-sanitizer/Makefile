# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	opentype-sanitizer
PORTVERSION=	8.1.3
DISTVERSIONSUFFIX=	.post1
CATEGORIES=	x11-fonts python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper for the OpenType Sanitizer

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=0:devel/py-setuptools_scm@${PY_FLAVOR}
RUN_DEPENDS=	ots-sanitize:x11-fonts/ots

USES=		python:3.6+
USE_PYTHON=	autoplist concurrent distutils

NO_TEST=	yes

LDFLAGS+=	-lpython${PYTHON_VER}${PYTHON_ABIVER}

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|' ${WRKSRC}/src/python/ots/__init__.py
	@${RM} -r ${WRKSRC}/src/c/

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/ots/ots-sanitize*.so

.include <bsd.port.mk>
