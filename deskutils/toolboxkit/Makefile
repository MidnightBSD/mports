PORTNAME=	toolbox
PORTVERSION=	0.8
PORTREVISION=	5
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://ftp.azc.uam.mx/mirrors/gnu/savannah/files/toolbox/Release.pkg/0.8/ \
		FREEBSD_LOCAL/dinoex
PKGNAMESUFFIX=	kit${PKGNAMESUFFIX2}
DISTNAME=	Toolbox-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolbox bundle for GNUstep
WWW=		https://www.nongnu.org/toolbox/

LICENSE=        gpl2+

USES=           gnustep
USE_GNUSTEP=    back build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/Toolbox/Toolbox

.include <bsd.port.mk>
