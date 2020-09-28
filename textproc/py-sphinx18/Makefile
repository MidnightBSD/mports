# Created by: Li-Wen Hsu <lwhsu@FreeBSD.org>

PORTNAME=	sphinx
PORTVERSION=	1.8.5
PORTEPOCH=	1
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	18
DISTNAME=	Sphinx-${PORTVERSION}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python documentation generator

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Jinja2>=2.3:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.11:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.5:devel/py-six@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}Babel>=1.3:devel/py-babel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=2.3:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.11:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-websupport11>=1.0.1:textproc/py-sphinxcontrib-websupport11@${PY_FLAVOR} \
		${PY_PYGMENTS} \
		${PYTHON_PKGNAMEPREFIX}sphinx_rtd_theme>=0.1:textproc/py-sphinx_rtd_theme@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}alabaster>=0.7<0.8:textproc/py-alabaster@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}snowballstemmer>=1.1:textproc/py-snowballstemmer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}six>=1.5:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.0.0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}imagesize>=0:graphics/py-imagesize@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PY_TYPING} \
		${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss

USES=		python
USE_PYTHON=	autoplist distutils concurrent

CONFLICTS_INSTALL=	py*-sphinx

NO_ARCH=	yes
NO_TEST=	yes

PORTSCOUT=	limit:^1\.8\.

.include <bsd.port.mk>
