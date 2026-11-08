PORTNAME=	ruamel.yaml
PORTVERSION=	0.19.1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME:S,.,_,}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	YAML 1.2 loader/dumper package for Python
WWW=		https://sourceforge.net/p/ruamel-yaml

LICENSE=	mit
LICENSE_FILE=	${WRKDIR}/LICENSE.mports

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}ruamel.yaml.clib>=0.2.6:devel/py-ruamel.yaml.clib@${PY_FLAVOR}

USES=		python:3.9+
USE_PYTHON=	autoplist distutils

NO_ARCH=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

# Upstream omits LICENSE during install but records it in its file list.
post-extract:
	@${MV} ${WRKSRC}/LICENSE ${WRKDIR}/LICENSE.mports

.include <bsd.port.mk>
