PORTNAME=	furo
PORTVERSION=	2025.12.19
CATEGORIES=	textproc python
MASTER_SITES=	PYPI \
		FREEBSD_LOCAL/sunpoet:static
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		${DISTNAME}-static${EXTRACT_SUFX}:static

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Clean customizable Sphinx documentation theme
WWW=		https://pradyunsg.me/furo/ \
		https://github.com/pradyunsg/furo

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.9.0:devel/py-flit-core@${PY_FLAVOR}

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}accessible-pygments>=0.0.5:textproc/py-accessible-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}beautifulsoup>=0:www/py-beautifulsoup@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.7:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=7.0,1<10.0,1:textproc/py-sphinx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx-basic-ng>=1.0.0b2:textproc/py-sphinx-basic-ng@${PY_FLAVOR}

USES=		python:3.11+
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

post-patch:
	@${FIND} ${WRKSRC} -name .gitignore -delete

post-install:
	cd ${WRKDIR}/static/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/furo/theme/furo/static/

.include <bsd.port.mk>
