PORTNAME=	fwget
DISTVERSION=	v1.0.4
CATEGORIES=	sysutils python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HPE firmware pack utility
WWW=		https://github.com/HewlettPackard/fwget

LICENSE=	gpl2

RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}requests>=2.28.1:www/py-requests@${PY_FLAVOR}

USES=		python shebangfix
USE_GITHUB=	yes
GH_PROJECT=	fwget
GH_ACCOUNT=	HewlettPackard
GH_TAGNAME=	9441304e6a782ca912f0c4eaf8c3f513e7c35c9c
NO_BUILD=	yes
SHEBANG_FILES=	fwget.py

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/fwget.py ${PREFIX}/sbin/fwget

.include <bsd.port.mk>
