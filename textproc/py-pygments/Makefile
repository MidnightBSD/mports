PORTNAME=	pygments
DISTVERSION=	2.7.2
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	Pygments-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Syntax highlighter written in Python

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	distutils concurrent autoplist

CONFLICTS_INSTALL=	py??-pygments-25

NO_ARCH=	yes

.include <bsd.port.pre.mk>

.if ${PYTHON_VER} == ${PYTHON_DEFAULT}
CONFLICTS_INSTALL=	paraview
.endif

.include <bsd.port.post.mk>
