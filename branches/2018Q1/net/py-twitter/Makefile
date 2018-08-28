# $MidnightBSD$

PORTNAME=	twitter
PORTVERSION=	1.0
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	python-${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python wrapper around the Twitter API

LICENSE=	apache2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}simplejson>0:${PORTSDIR}/devel/py-simplejson \
		${PYTHON_PKGNAMEPREFIX}oauth2>0:${PORTSDIR}/net/py-oauth2 \
		${PYTHON_PKGNAMEPREFIX}httplib2>0:${PORTSDIR}/www/py-httplib2

USE=		python:2
USE_PYTHON=	distutils autoplist
PYDISTUTILS_PKGNAME=	python_twitter

.include <bsd.port.mk>
