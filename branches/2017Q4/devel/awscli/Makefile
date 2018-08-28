# $MidnightBSD$

PORTNAME=	awscli
PORTVERSION=	1.11.13
CATEGORIES=	devel
MASTER_SITES=	CHEESESHOP

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Universal Command Line Interface for Amazon Web Services

LICENSE=	apache2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}botocore>=1.4.46:${PORTSDIR}/devel/py-botocore \
		${PYTHON_PKGNAMEPREFIX}colorama>=0.2.5:${PORTSDIR}/devel/py-colorama \
		${PYTHON_PKGNAMEPREFIX}s3transfer>=0.1.0:${PORTSDIR}/net/py-s3transfer \
		${PYTHON_PKGNAMEPREFIX}docutils>=0.10:${PORTSDIR}/textproc/py-docutils \
		${PYTHON_PKGNAMEPREFIX}rsa>=3.1.2:${PORTSDIR}/security/py-rsa

USES=		python:2
USE_PYTHON=	autoplist distutils
NO_ARCH=	yes

.include <bsd.port.mk>
