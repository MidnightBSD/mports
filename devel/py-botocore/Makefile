# Created by: Alexey V. Degtyarev <alexey@renatasystems.org>
# $FreeBSD: head/devel/py-botocore/Makefile 405912 2016-01-12 20:25:49Z skreuzer $
# $MidnightBSD$

PORTNAME=	botocore
PORTVERSION=	1.3.17
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Low-level, core functionality of boto 3

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}dateutil>=2.1:${PORTSDIR}/devel/py-dateutil \
		${PYTHON_PKGNAMEPREFIX}jmespath>=0.9.0:${PORTSDIR}/devel/py-jmespath \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.10:${PORTSDIR}/textproc/py-docutils

USES=		python:2
USE_PYTHON=	autoplist distutils

.include <bsd.port.mk>
