# Created by: Steve Wills <swills@FreeBSD.org>
# $FreeBSD: head/net/py-ec2-cli-tools/Makefile 412348 2016-04-01 14:16:16Z mat $
# $MidnightBSD$

PORTNAME=	ec2-cli-tools
PORTVERSION=	1.5
CATEGORIES=	net python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helpful CLI utilities for querying and connecting to EC2 instances

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}boto>=1.0:${PORTSDIR}/devel/py-boto \
		bash:${PORTSDIR}/shells/bash

USE_PYTHON=	distutils autoplist
USES=		python shebangfix
SHEBANG_FILES=	bin/ec2getsnaps bin/ec2hostcache bin/ec2ssh

.include <bsd.port.mk>
