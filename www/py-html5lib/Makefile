# Created by: ijliao
# $MidnightBSD$
# $FreeBSD: head/www/py-html5lib/Makefile 392400 2015-07-18 00:10:54Z rm $

PORTNAME=	html5lib
PORTVERSION=	1.0.1
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python based HTML parser based on the HTML5 spec

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}six>0:devel/py-six@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}webencodings>0:converters/py-webencodings@${PY_FLAVOR}

NO_ARCH=	yes
USES=		python
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
