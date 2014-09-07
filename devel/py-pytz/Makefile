# $MidightBSD$

PORTNAME=	pytz
PORTVERSION=	2014.4
PORTEPOCH=	1
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	World Timezone Definitions for Python

LICENSE=	mit

USES=		tar:bzip2
USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_AUTOPLIST=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|=True|=False|' ${WRKSRC}/setup.py

.include <bsd.port.mk>
