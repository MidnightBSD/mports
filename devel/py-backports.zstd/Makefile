PORTNAME=	backports.zstd
PORTVERSION=	1.7.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	backports_zstd-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Backport of compression.zstd
WWW=		https://github.com/Rogdham/backports.zstd

LICENSE=	python
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		localbase:ldflags python:3.11-3.13 python-setuptools:83
USE_PYTHON=	autoplist concurrent pep517

PEP517_WHEEL_DISTNAME=	${PORTNAME:tl:C|[-_.]+|_|g}

LDFLAGS+=	-lzstd

post-patch:
# Clean up bundled libraries
	@${RM} -r ${WRKSRC}/src/c/zstd/lib/

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
