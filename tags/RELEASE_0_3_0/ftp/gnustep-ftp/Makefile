# New ports collection makefile for:    ftp
# Date created:         05 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/ftp/gnustep-ftp/Makefile,v 1.3 2008/09/30 21:19:31 laffer1 Exp $
# $FreeBSD: ports/ftp/gnustep-ftp/Makefile,v 1.3 2007/01/31 18:17:58 dinoex Exp $
#

PORTNAME=	ftp
PORTVERSION=	0.2
CATEGORIES=	ftp gnustep
MASTER_SITES=	${MASTER_SITE_SAVANNAH}
MASTER_SITE_SUBDIR=	gap
PKGNAMEPREFIX=	gnustep-
DISTNAME=	FTP-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compact and handy FTP client for GNUstep
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

post-patch:
	${REINPLACE_CMD} -e 's|^GNUSTEP_INSTALLATION_DIR|#GNUSTEP_INSTALLATION_DIR|' \
		${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
