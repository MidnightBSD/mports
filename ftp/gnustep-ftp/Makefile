PORTNAME=	ftp
PORTVERSION=	0.6
PORTREVISION=	2
CATEGORIES=	ftp gnustep
MASTER_SITES=	SAVANNAH/gap
PKGNAMEPREFIX=	gnustep-
DISTNAME=	FTP-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact and handy FTP client for GNUstep
WWW=		https://www.nongnu.org/gap/ftp/index.htm

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
