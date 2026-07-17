PORTNAME=	compreffor
DISTVERSION=	0.5.4
PORTREVISION=	2
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CFF table subroutinizer for FontTools
WWW=		https://github.com/googlefonts/compreffor

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}cython>=0.29.30:devel/py-cython@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools_git_ls_files>=0:devel/py-setuptools_git_ls_files@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}fonttools>=4:print/py-fonttools@${PY_FLAVOR}

USES=		compiler:c++11-lang python
USE_PYTHON=	autoplist concurrent pep517

MAKE_ENV+=	CYTHON_FORCE_REGEN=1

pre-build:
	@${TOUCH} ${BUILD_WRKSRC}/src/cython/_compreffor.pyx

.include <bsd.port.mk>
