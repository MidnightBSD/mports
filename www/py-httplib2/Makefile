# $MidnightBSD$

PORTNAME=	httplib2
PORTVERSION=	0.8
PORTREVISION=	1
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_GOOGLE_CODE}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A comprehensive HTTP client library

LICENSE=	mit

USE_PYTHON=	yes
USE_PYDISTUTILS=	yes
PYDISTUTILS_AUTOPLIST=	yes

.include <bsd.port.pre.mk>

post-patch:
	${FIND} ${WRKSRC} -type f -exec ${CHMOD} 644 {} \;
	${FIND} ${WRKSRC} -type d -exec ${CHMOD} 755 {} \;

.include <bsd.port.post.mk>
