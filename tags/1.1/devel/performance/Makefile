# New ports collection makefile for:	performance
# Date created:         28 Oct 2006
# Whom:                 dirk.meyer@dinoex.sub.org
#
# $MidnightBSD$
# $FreeBSD: ports/devel/performance/Makefile,v 1.4 2007/01/31 18:17:57 dinoex Exp $
#

PORTNAME=	performance
PORTVERSION=	0.5.0
CATEGORIES=	devel gnustep
MASTER_SITES=	GNUSTEP/libs
DISTNAME=	Performance-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Help improve the performance of GNUstep applications

LICENSE=	lgpl3

USES=		gnustep
USE_GNUSTEP=	base build
USE_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

post-install:
	(cd ${WRKSRC}; . ${GNUSTEP_MAKEFILES}/GNUstep.sh; \
                ${SETENV} ${MAKE_ENV} ${GMAKE} -d ${MAKE_FLAGS} ${MAKEFILE} ${FAKE_MAKEARGS} ${INSTALL_TARGET})


.include <bsd.port.mk>
