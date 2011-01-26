# New ports collection makefile for:    toolbox
# Date created:         18 Dec 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/deskutils/toolbox/Makefile,v 1.4 2008/10/23 13:34:02 laffer1 Exp $
# $FreeBSD: ports/deskutils/toolbox/Makefile,v 1.3 2007/02/25 06:48:25 dinoex Exp $
#

PORTNAME=	toolbox
PORTVERSION=	0.8
PORTREVISION=	2
CATEGORIES=	deskutils gnustep
MASTER_SITES=	http://ftp.azc.uam.mx/mirrors/gnu/savannah/files/toolbox/Release.pkg/0.8/ \
		${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR=	dinoex
DISTNAME=	Toolbox-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collection of tools for GNUstep
LICENSE=	gpl2

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LOCAL_LIBS+=	Toolbox:${TOOLBOXKIT_PORT}

WRKSRC=		${WRKDIR}/Toolbox

TOOLBOXKIT_PORT?=	deskutils/toolboxkit

post-patch:
	${REINPLACE_CMD} -e 's| Toolbox ||' ${WRKSRC}/GNUmakefile

.include <bsd.port.mk>
