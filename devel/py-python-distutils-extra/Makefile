# Created by: Ju Pengfei <jupengfei@gmail.com>

PORTNAME=	python-distutils-extra
PORTVERSION=	2.45
CATEGORIES=	devel python
MASTER_SITES=	DEBIAN
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	${PORTNAME}_${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Add support for i18n, documentation, and icons to distutils

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python tar:xz
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes
WRKSRC=		${WRKDIR}/${PORTNAME}

.include <bsd.port.mk>
