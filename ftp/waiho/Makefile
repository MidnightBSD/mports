PORTNAME=	waiho
PORTVERSION=	0.2
PORTREVISION=	3
CATEGORIES=	ftp gnustep
MASTER_SITES=	http://www.roard.com/waiho/download/
DISTNAME=	Waiho-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple FTP client for GNUstep
WWW=		http://www.roard.com/waiho/

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:tgz gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/System/Applications/Waiho.app/Waiho

.include <bsd.port.mk>
