PORTNAME=	ec2-cli-tools
PORTVERSION=	1.5
PORTREVISION=	1
CATEGORIES=	net python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Helpful CLI utilities for querying and connecting to EC2 instances

LICENSE=	mit

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}boto>=1.0:devel/py-boto@${PY_FLAVOR} \
		bash:shells/bash

USE_PYTHON=	distutils autoplist
USES=		python shebangfix
SHEBANG_FILES=	bin/ec2getsnaps bin/ec2hostcache bin/ec2ssh

.include <bsd.port.mk>
