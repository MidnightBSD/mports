# New ports collection makefile for:    renaissance
# Date created:         007 Sep 2006
# Whom:                 gurkan@linuks.mine.nu
#
# $MidnightBSD: mports/x11-toolkits/renaissance/Makefile,v 1.4 2007/11/07 20:20:18 ctriv Exp $
# $FreeBSD: ports/x11-toolkits/renaissance/Makefile,v 1.1 2006/09/10 12:12:28 dinoex Exp $
#

PORTNAME=	renaissance
PORTVERSION=	0.8.0
PORTREVISION=	3
CATEGORIES=	x11-toolkits
MASTER_SITES=	http://www.gnustep.it/Renaissance/Download/ \
		http://florida.ethz.ch/ports/distfiles/
DISTNAME=	Renaissance-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNUstep GUI Development Framework

WRKSRC=		${WRKDIR}/${DISTNAME}
USE_GMAKE=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_PREFIX=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
# broken:
#USE_LDCONFIG=	yes
INSTALL_SHLIBS=	yes
MAKEFILE=	GNUmakefile

.include <bsd.port.mk>
