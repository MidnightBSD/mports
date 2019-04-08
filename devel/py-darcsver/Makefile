PORTNAME=	darcsver
PORTVERSION=	1.7.4
PORTREVISION=	2
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate a version number from darcs history

LICENSE=	bsd3

USES=		python:2.7
USE_PYTHON=	distutils autoplist
NO_ARCH=	yes

post-patch:
	@${REINPLACE_CMD} -e 's#(doc_loc, data_fnames)##g' ${WRKSRC}/setup.py

.include <bsd.port.mk>
