PORTNAME=	atpublic
PORTVERSION=	3.0
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Very simple decorator and function of module's all

LICENSE=	Apache-2.0

USES=		python
USE_PYTHON=	autoplist distutils

MAKE_ENV=	ATPUBLIC_BUILD_EXTENSION=1

post-extract:
	${CP} ${FILESDIR}/setup* ${WRKSRC}

.include <bsd.port.mk>
