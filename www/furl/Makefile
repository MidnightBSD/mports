# New ports collection makefile for:	furl
# Date created:				3 January 2007
# Whom:					Phil Pereira <phil@bsdnexus.com>

PORTNAME=	furl
PORTVERSION=	3.0
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to display the HTTP headers returned by web-servers

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=       ${MACHINE_ARCH}-portbld-midnightbsd${OSREL}

USE_GITHUB=     yes
GH_ACCOUNT=     bingos
GH_PROJECT=     ${PORTNAME}
GH_TAGNAME=	38f66d0

WRKSRC=	${WRKDIR}/${PORTNAME}-${GH_TAGNAME}

.include <bsd.port.mk>
