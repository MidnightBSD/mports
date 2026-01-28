PORTNAME=	iso-codes
PORTVERSION=	4.20.1
CATEGORIES=	misc
MASTER_SITES=	DEBIAN_POOL
DISTNAME=	iso-codes_${PORTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lists of the country, language, and currency iso names
WWW=		https://salsa.debian.org/iso-codes-team/iso-codes

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSES/LGPL-2.1-or-later.txt

USES=		gettext-tools meson python:build tar:xz

BINARY_ALIAS=	python3=${PYTHON_CMD}
NO_ARCH=	yes
WRKSRC=		${WRKDIR}/iso-codes-${PORTVERSION}

.include <bsd.port.mk>
