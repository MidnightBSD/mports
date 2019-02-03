# Created by: Cheng-Lung Sung <clsung@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/devel/py-six/Makefile 390642 2015-06-26 14:46:40Z koobs $

PORTNAME=	six
PORTVERSION=	1.9.0
CATEGORIES=	devel python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python 2 and 3 compatibility utilities

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:${PORTSDIR}/devel/py-pytest

USES=		python
USE_PYTHON=	autoplist concurrent distutils

regression-test: build
	@cd ${WRKSRC} && ${PYTHON_CMD} -m pytest -v

.include <bsd.port.mk>
