# $MidnightBSD$

PORTNAME=	sphinx
PORTVERSION=	1.1.3
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Sphinx-${PORTVERSION}
DIST_SUBDIR=	python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python documentation generator

LICENSE=	bsd3

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>=1.2:${PORTSDIR}/textproc/py-pygments \
		${PYTHON_PKGNAMEPREFIX}Jinja2>=2.3:${PORTSDIR}/devel/py-Jinja2 \
		${PYTHON_PKGNAMEPREFIX}MarkupSafe>=0.18:${PORTSDIR}/textproc/py-MarkupSafe \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.7:${PORTSDIR}/textproc/py-docutils
RUN_DEPENDS=	${BUILD_DEPENDS}

USE_PYTHON=	yes
USE_PYDISTUTILS=	easy_install
PYDISTUTILS_PKGNAME=	Sphinx

PLIST_SUB=	PYTHON_VER=${PYTHON_VER}

post-install:
	@${SETENV} PYTHONPATH=${PYTHONPREFIX_SITELIBDIR} \
	${PYTHON_CMD} -m sphinx.pycode.pgen2.driver -c 'import load_grammar'

.include <bsd.port.mk>
