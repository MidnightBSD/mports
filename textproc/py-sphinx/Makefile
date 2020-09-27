PORTNAME=	sphinx
PORTVERSION=	3.2.1
PORTEPOCH=	1
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Sphinx-${PORTVERSION}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python documentation generator

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sphinxcontrib-applehelp>=0:textproc/py-sphinxcontrib-applehelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-devhelp>=0:textproc/py-sphinxcontrib-devhelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-jsmath>=0:textproc/py-sphinxcontrib-jsmath@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-htmlhelp>=0:textproc/py-sphinxcontrib-htmlhelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-serializinghtml>=0:textproc/py-sphinxcontrib-serializinghtml@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}sphinxcontrib-qthelp>=0:textproc/py-sphinxcontrib-qthelp@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=2.3:devel/py-Jinja2@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pygments>=2.0:textproc/py-pygments@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.12:textproc/py-docutils@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}snowballstemmer>=1.1:textproc/py-snowballstemmer@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}Babel>=1.3:devel/py-babel@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}alabaster>=0.7<0.8:textproc/py-alabaster@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}imagesize>=0:graphics/py-imagesize@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}requests>=2.5.0:www/py-requests@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}packaging>=0:devel/py-packaging@${PY_FLAVOR} \
		${PY_TYPING} \
		${LOCALBASE}/share/certs/ca-root-nss.crt:security/ca_root_nss

USES=		python:3.5+
USE_PYTHON=	autoplist distutils concurrent

CONFLICTS_INSTALL=	py*-sphinx18

NO_ARCH=	yes
NO_TEST=	yes

# Upstream archive contains files with UTF-8 names (#246618)
EXTRACT_CMD=	${SETENV} LC_ALL=en_US.UTF-8 /usr/bin/bsdtar

.include <bsd.port.mk>
