# New ports collection makefile for:    ftp
# Date created:         05 Nov 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/ftp/gnustep-ftp/Makefile,v 1.2 2007/11/07 20:20:13 ctriv Exp $
# $FreeBSD: ports/ftp/gnustep-ftp/Makefile,v 1.3 2007/01/31 18:17:58 dinoex Exp $
#

PORTNAME=	ftp
PORTVERSION=	0.1
PORTREVISION=	1
CATEGORIES=	ftp gnustep
MASTER_SITES=	http://download.savannah.gnu.org/releases/gap/
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
