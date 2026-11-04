PORTNAME=	mpdcon
PORTVERSION=	1.5.1
PORTREVISION=	2
CATEGORIES=	audio gnustep
MASTER_SITES=	SAVANNAH/gap
DISTNAME=	MPDCon-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	MPD client for GNUstep
WWW=		https://gap.nongnu.org/mpdcon/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/Documentation/COPYING

USES=		gnustep
USE_GNUSTEP=	base gui back build

CFLAGS+=	-Wno-error=incompatible-function-pointer-types

LIB_DEPENDS=	libmpdclient.so.2:audio/libmpdclient \
		libSQLClient.so:databases/sqlclient

post-patch:
	${REINPLACE_CMD} -e \
		's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
			${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
