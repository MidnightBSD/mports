# New ports collection makefile for:    toolbox
# Date created:         18 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/toolboxkit/Makefile,v 1.4 2009/04/05 19:47:27 laffer1 Exp $
# $FreeBSD: ports/deskutils/toolboxkit/Makefile,v 1.4 2007/02/25 06:48:26 dinoex Exp $
#

PORTNAME=	toolbox
PORTVERSION=	0.8
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://ftp.azc.uam.mx/mirrors/gnu/savannah/files/toolbox/Release.pkg/0.8/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
PKGNAMESUFFIX=	kit${PKGNAMESUFFIX2}
DISTNAME=	Toolbox-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Toolbox bundle for GNUstep
LICENSE=        gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

WRKSRC=		${WRKDIR}/Toolbox
USE_GNUSTEP_MAKE_DIRS+=	Toolbox

.include <bsd.port.mk>
