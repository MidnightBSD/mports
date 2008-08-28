# New ports collection makefile for:    gnustep-examples
# Date created:         15 Mar 2003
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD: mports/misc/gnustep-examples/Makefile,v 1.3 2007/11/07 20:20:14 ctriv Exp $
# $FreeBSD: ports/misc/gnustep-examples/Makefile,v 1.15 2006/09/12 17:26:16 dinoex Exp $
#

PORTNAME=	gnustep-examples
PORTVERSION=	1.2.0
PORTREVISION=	0
CATEGORIES=	misc gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep example applications
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${DISTNAME}
GUN_CONFIGURE=	yes
USE_GL=		yes
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes

USE_GNUSTEP_MAKE_DIRS+=	. gui/Finger gui/GFractal gui/HostAddress
MAKE_ENV+=	GNUSTEP_INSTALLATION_DIR=${GNUSTEP_LOCAL_ROOT}

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
