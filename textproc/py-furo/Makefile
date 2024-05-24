PORTNAME=	furo
PORTVERSION=	2024.1.29
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

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}beautifulsoup>=0:www/py-beautifulsoup@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.7:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx>=5.0,1<8.0,1:textproc/py-sphinx@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinx-basic-ng>=0:textproc/py-sphinx-basic-ng@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

post-patch:
	@${SED} -e 's|%%PORTVERSION%%|${PORTVERSION}|' ${FILESDIR}/setup.py > ${WRKSRC}/setup.py

post-install:
	cd ${WRKDIR}/static/ && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/furo/theme/furo/static/

.include <bsd.port.mk>
