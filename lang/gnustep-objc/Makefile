# New ports collection makefile for:    gnustep-objc
# Date created:         17 April 2001
# Whom:                 Thomas Gellekum <tg@FreeBSD.org>
#
# $MidnightBSD: mports/lang/gnustep-objc/Makefile,v 1.2 2007/11/07 20:20:14 ctriv Exp $
# $FreeBSD: ports/lang/gnustep-objc/Makefile,v 1.47 2006/03/19 04:35:46 dinoex Exp $
#

PORTNAME=	gnustep-objc
PORTVERSION=	1.6.0
PORTREVISION=	o
PORTEPOCH=	1
CATEGORIES=	lang devel gnustep
MASTER_SITES=	${MASTER_SITE_GNUSTEP}
MASTER_SITE_SUBDIR=	libs

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A snapshot of libobjc, meant to be used with GNUstep

USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
GNUSTEP_WITHOUT_LIBOBJC=	yes
MAKEFILE=	GNUmakefile
ALL_TARGET=
INSTALLS_SHLIB=	yes
LDCONFIG_DIRS=	${LOCALLIBDIR}
NOT_FOR_ARCHS=	amd64

.if !defined(GNUSTEP_WITH_BASE_GCC)
IGNORE=		conflicts: libobjc is used from lang/gcc-objc
.endif

.include <bsd.port.mk>
