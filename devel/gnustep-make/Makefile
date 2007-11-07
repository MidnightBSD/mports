# New ports collection makefile for:    gnustep-make
# Date created:         17 April 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/devel/gnustep-make/Makefile,v 1.5 2007/07/30 17:14:24 laffer1 Exp $
# $FreeBSD: ports/devel/gnustep-make/Makefile,v 1.69 2006/08/31 05:35:31 dinoex Exp $
#

PORTNAME=	gnustep-make
PORTVERSION=	2.0.1
PORTREVISION=	1
CATEGORIES=	devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	core

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep makefile package

USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	
MAKE_FLAGS=	OPTFLAG="${CFLAGS}"
CFLAGS+=	${PTHREAD_CFLAGS}
CONFIGURE_ENV+= INSTALL_PROGRAM="${INSTALL} -c" INSTALL_DATA="${INSTALL} -c" \
  	 CFLAGS="${CFLAGS}"
CONFIGURE_ARGS+=	--with-thread-lib="${PTHREAD_LIBS}"
CONFIGURE_ARGS+=	--with-config-file=${PREFIX}/GNUstep.conf

.if defined(GNUSTEP_WITH_BASE_GCC)
GNUSTEP_WITHOUT_LIBOBJC=	yes
.endif

post-install:
	${LN} -s Library/Makefiles ${PREFIX}/System/
	-${MKDIR} ${PREFIX}/Local/Applications
	-${MKDIR} ${PREFIX}/Local/Library/ApplicationSupport
	-${MKDIR} ${PREFIX}/Local/Library/Bundles
	-${MKDIR} ${PREFIX}/Local/Library/Documentation
	-${MKDIR} ${PREFIX}/Local/Library/Frameworks
	-${MKDIR} ${PREFIX}/Local/Library/Headers
	-${MKDIR} ${PREFIX}/Local/Library/Libraries
	-${MKDIR} ${PREFIX}/Local/Library/Preferences
	-${MKDIR} ${PREFIX}/Local/Library/Services
	-${MKDIR} ${PREFIX}/Local/Tools/Resources

.include <bsd.port.mk>
