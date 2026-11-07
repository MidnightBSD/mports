PORTNAME=	cmarkgfm
PORTVERSION=	2025.10.22
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minimal bindings to GitHub fork of cmark
WWW=		https://github.com/theacodes/cmarkgfm

LICENSE=	mit bsd2
LICENSE_COMB=	multi
LICENSE_FILE_mit=	${WRKSRC}/LICENSE.txt
LICENSE_FILE_bsd2=	${WRKSRC}/third_party/cmark/COPYING

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}cffi>=2.0.0:devel/py-cffi@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pycparser>=2.06:devel/py-pycparser@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cffi>=2.0.0:devel/py-cffi@${PY_FLAVOR}

USES=		python:3.10+ python-setuptools:modern
USE_PYTHON=	autoplist concurrent pep517 pytest

post-install:
	${FIND} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR} -name '*.so' -exec ${STRIP_CMD} {} +

.include <bsd.port.mk>
