PORTNAME=	configparser
PORTVERSION=	3.5.3
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	INI style configuration file parser
WWW=		https://pypi.org/project/configparser/

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}backports>=0:devel/py-backports@${PY_FLAVOR}

USES=		python
USE_LOCALE=	en_US.UTF-8
USE_PYTHON=	distutils autoplist

NO_ARCH=	yes

POST_PLIST=	trim-backports-namespace

post-install:
	@${RM} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/backports/__init__.py*
	@${RM} -r ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/backports/__pycache__

trim-backports-namespace:
	@${REINPLACE_CMD} '/backports\/__init__.py*/d' ${TMPPLIST}
	@${REINPLACE_CMD} '/backports\/__pycache__*/d' ${TMPPLIST}

.include <bsd.port.mk>
