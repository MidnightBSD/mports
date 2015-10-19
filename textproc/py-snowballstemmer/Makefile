# $MidnightBSD$
# $FreeBSD: head/textproc/py-snowballstemmer/Makefile 393635 2015-08-06 07:07:33Z lwhsu $

PORTNAME=	snowballstemmer
PORTVERSION=	1.2.0
CATEGORIES=	textproc python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Snowball stemming library collection for Python

LICENSE=	bsd2

USES=		python
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	PYSTEMMER
OPTIONS_DEFAULT=PYSTEMMER
PYSTEMMER_DESC=	Use PyStemmer to accelerate

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPYSTEMMER}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pystemmer>0:${PORTSDIR}/textproc/py-pystemmer
.endif

.include <bsd.port.mk>
