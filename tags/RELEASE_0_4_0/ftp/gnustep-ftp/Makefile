# $MidnightBSD: mports/ftp/gnustep-ftp/Makefile,v 1.4 2009/04/05 15:35:17 laffer1 Exp $

PORTNAME=	ftp
PORTVERSION=	0.3
CATEGORIES=	ftp gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
PKGNAMEPREFIX=	gnustep-
DISTNAME=	FTP-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact and handy FTP client for GNUstep
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
