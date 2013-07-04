# $MidnightBSD: mports/x11-themes/etoile-camaelon/Makefile,v 1.6 2009/12/13 21:01:04 laffer1 Exp $

PORTNAME=	camaelon
PORTVERSION=	0.4.1
CATEGORIES=	x11-themes gnustep
MASTER_SITES=	http://download.gna.org/etoile/
PKGNAMEPREFIX=	etoile-
DISTNAME=	etoile-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Etoile Project Camaelon bundle
LICENSE=	lgpl

USE_BZIP2=	yes
USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_LOCAL_LIBRARIES}

CONFLICTS=	camaelon-nesedah-*

WRKSRC=	${WRKDIR}/Etoile-${PORTVERSION}
USE_GNUSTEP_MAKE_DIRS+=	Bundles/Camaelon

install-user:
	@(. ${SYSMAKEDIR}/GNUstep.sh && defaults write Camaelon Theme Nesedah)

deinstall-user:
	@(. ${SYSMAKEDIR}/GNUstep.sh && defaults delete Camaelon Theme)

.include <bsd.port.mk>
