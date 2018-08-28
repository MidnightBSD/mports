# $MidightBSD$

PORTNAME=	pytz
PORTVERSION=	2015.4
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	World Timezone Definitions for Python

LICENSE=	mit

USES=		python tar:bzip2
USE_PYTHON=	autoplist distutils

post-patch:
	@${REINPLACE_CMD} -e 's|=True|=False|' ${WRKSRC}/${PYSETUP}

.include <bsd.port.mk>
