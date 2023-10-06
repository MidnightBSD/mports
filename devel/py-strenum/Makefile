PORTNAME=	StrEnum
DISTVERSION=	0.4.15
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Enum that inherits from str
WWW=		https://pypi.org/project/StrEnum/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist distutils pytest

post-patch:
	@${REINPLACE_CMD} '/pytest-runner/d' ${WRKSRC}/setup.py

.include <bsd.port.mk>
