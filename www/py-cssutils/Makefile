PORTNAME=	cssutils
PORTVERSION=	2.9.0
PORTEPOCH=	1
CATEGORIES=	www python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CSS Cascading Style Sheets library for Python
WWW=		https://github.com/jaraco/cssutils

LICENSE=	gpl3 lgpl3
LICENSE_COMB=	dual
LICENSE_FILE_gpl3=	${WRKSRC}/COPYING
LICENSE_FILE_lgpl3=	${WRKSRC}/COPYING.LESSER

BUILD_DEPENDS=	${PY_SETUPTOOLS} \
		${PYTHON_PKGNAMEPREFIX}setuptools-scm>=3.4.1:devel/py-setuptools-scm@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	EXAMPLES

post-install-EXAMPLES-on:
	${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/
	${INSTALL_DATA} ${WRKSRC}/examples/* ${FAKE_DESTDIR}${EXAMPLESDIR}/

.include <bsd.port.mk>
