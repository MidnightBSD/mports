# New ports collection makefile for:    gnustep-examples
# Date created:         15 Mar 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/misc/gnustep-examples/Makefile,v 1.2 2007/08/15 06:11:20 laffer1 Exp $
# $FreeBSD: ports/misc/gnustep-examples/Makefile,v 1.15 2006/09/12 17:26:16 dinoex Exp $
#

BROKEN=		Does not create a package properly

PORTNAME=	gnustep-examples
PORTVERSION=	1.1.0
PORTREVISION=	1
CATEGORIES=	misc gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep example applications

WRKSRC=		${WRKDIR}/${DISTNAME}
GUN_CONFIGURE=	yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

USE_GNUSTEP_MAKE_DIRS+=	. gui/Finger gui/GFractal gui/HostAddress
MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=LOCAL


#post-build:
#.for i in ${MAKE_APPS}
#	@(cd ${WRKSRC}/gui/${i}; . ${SYSMAKEDIR}/GNUstep.sh; \
#		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${ALL_TARGET})
#.endfor

#post-install:
#.for i in ${INSTALL_APPS}
#	@(cd ${WRKSRC}/gui/${i}; . ${SYSMAKEDIR}/GNUstep.sh; \
#		${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${INSTALL_TARGET})
#.endfor

.include <bsd.port.mk>
