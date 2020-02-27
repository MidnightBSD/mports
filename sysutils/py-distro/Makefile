PORTNAME=	distro
PORTVERSION=	1.4.0
CATEGORIES=	sysutils python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux OS platform information API

LICENSE=	apache2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python shebangfix
USE_PYTHON=	autoplist concurrent distutils

SHEBANG_FILES=	query_local_distro.py
NO_ARCH=	yes

.include <bsd.port.mk>
