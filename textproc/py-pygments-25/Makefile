# Created by: Nicola Vitale <nivit@FreeBSD.org>

PORTNAME=	pygments
PORTVERSION=	2.5.2
PORTREVISION=	0
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	-25
DISTNAME=	Pygments-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Syntax highlighter written in Python

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python
USE_PYTHON=	distutils concurrent autoplist

CONFLICTS_INSTALL=	py??-pygments

NO_ARCH=	yes
NO_TEST=	yes

PORTSCOUT=	limit:^2\.5\.

.include <bsd.port.pre.mk>

.if ${PYTHON_VER} == ${PYTHON_DEFAULT}
CONFLICTS_INSTALL=	paraview
.endif

.include <bsd.port.post.mk>
