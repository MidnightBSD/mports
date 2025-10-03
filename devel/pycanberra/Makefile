PORTNAME=	pycanberra
DISTVERSION=	1
PORTREVISION=	0
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Very basic wrapper for libcanberra
WWW=		https://github.com/totdb/pycanberra

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		python
USE_PYTHON=	autoplist distutils optsuffix

USE_GITHUB=	yes
GH_ACCOUNT=	totdb
GH_TAGNAME=	88c53cd

post-patch:
	@(cd ${WRKSRC} && ${MKDIR} ${WRKSRC}/pycanberra && \
	${MV} pycanberra.py ${WRKSRC}/pycanberra && \
	${TOUCH} __init__.py)

.include <bsd.port.mk>
