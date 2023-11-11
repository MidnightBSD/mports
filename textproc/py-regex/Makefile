PORTNAME=	regex
DISTVERSION=	2022.9.13
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternative regular expression module, to replace re

LICENSE=	python

USES=		python
USE_PYTHON=	autoplist distutils

post-install:
	${STRIP_CMD} ${FAKE_DESTDIR}${PYTHONPREFIX_SITELIBDIR}/regex/_regex*.so

.include <bsd.port.mk>
