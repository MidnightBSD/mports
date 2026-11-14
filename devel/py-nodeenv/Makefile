PORTNAME=	nodeenv
PORTVERSION=	1.12.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Node.js virtual environment builder
WWW=		https://ekalinin.github.io/nodeenv/

LICENSE=	bsd3 mit
LICENSE_COMB=	multi
LICENSE_FILE_bsd3=	${FILESDIR}/LICENSE-bsd3
LICENSE_FILE_mit=	${FILESDIR}/LICENSE-node-mit

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools-scm>0:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>0:devel/py-wheel@${PY_FLAVOR}

RUN_DEPENDS=	gmake:devel/gmake \
		python3.11:lang/python311 \
		rust>=1.86.0:lang/rust

USES=		python
USE_PYTHON=	autoplist pep517

NO_ARCH=	yes

DISTVERSION=	1.12.0

PLIST_FILES=	${PYTHON_SITELIBDIR}/nodeenv-node-v13.1.0-midnightbsd.patch \
		${PYTHON_SITELIBDIR}/nodeenv-node-v13.1.0-midnightbsd.NOTICE

fake-post-install:
	${INSTALL_DATA} ${FILESDIR}/nodeenv-node-v13.1.0-midnightbsd.patch \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/nodeenv-node-v13.1.0-midnightbsd.patch
	${INSTALL_DATA} ${FILESDIR}/nodeenv-node-v13.1.0-midnightbsd.NOTICE \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/nodeenv-node-v13.1.0-midnightbsd.NOTICE

.include <bsd.port.mk>
