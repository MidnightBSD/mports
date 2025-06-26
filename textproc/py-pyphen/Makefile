PORTNAME=	pyphen
DISTVERSION=	0.17.0
CATEGORIES=	textproc python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module to hyphenate text based on Hunspell dictionaries
WWW=		https://pyphen.org/

LICENSE=	gpl2 lgpl2.1 MPL11
LICENSE_COMB=	multi
LICENSE_FILE_GPLv2=	${WRKSRC}/COPYING.GPL
LICENSE_FILE_lgpl2.1=	${WRKSRC}/COPYING.LGPL
LICENSE_FILE_gpl2=	${WRKSRC}/COPYING.MPL

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}flit-core>=3.2<4:devel/py-flit-core@${PY_FLAVOR}

USES=		python
USE_PYTHON=	pep517 autoplist pytest

NO_ARCH=	yes

.include <bsd.port.mk>
