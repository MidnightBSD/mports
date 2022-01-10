# Created by: Po-Chuan Hsieh <sunpoet@FreeBSD.org>

PORTNAME=	jaraco.context
PORTVERSION=	4.0.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Context managers by jaraco

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools_scm>=3.4.1:devel/py-setuptools_scm@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}jaraco>=0:devel/py-jaraco@${PY_FLAVOR}

USES=		python:3.7+
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
NO_TEST=	yes

POST_PLIST=	trim-jaraco-namespace

post-patch:
	@${REINPLACE_CMD} -e '/jaraco.apt/d; /yg.lockfile/d' ${WRKSRC}/setup.cfg

post-install:
	-${RM} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/jaraco/__init__.py*
	-@${RM} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/jaraco/__pycache__/__init__.*
	-@${RMDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/jaraco/__pycache__

trim-jaraco-namespace:
	@${REINPLACE_CMD} '/jaraco\/__init__\./d; /jaraco\/__pycache__\/__init__\./d' ${TMPPLIST}

.include <bsd.port.mk>
