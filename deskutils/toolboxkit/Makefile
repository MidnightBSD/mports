# New ports collection makefile for:    toolbox
# Date created:         18 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org

PORTNAME=	toolbox
PORTVERSION=	0.8
PORTREVISION=	4
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://ftp.azc.uam.mx/mirrors/gnu/savannah/files/toolbox/Release.pkg/0.8/ \
		FREEBSD_LOCAL/dinoex
PKGNAMESUFFIX=	kit${PKGNAMESUFFIX2}
DISTNAME=	Toolbox-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolbox bundle for GNUstep

LICENSE=        gpl2

USES=           gnustep
USE_GNUSTEP=    back build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/Toolbox/Toolbox

.include <bsd.port.mk>
