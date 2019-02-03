# $MidnightBSD$
# $FreeBSD: head/deskutils/systempreferences/Makefile 386312 2015-05-14 10:15:04Z mat $

PORTNAME=	systempreferences
PORTVERSION=	1.2.0
CATEGORIES=	deskutils gnustep
MASTER_SITES=	GNUSTEP/usr-apps
DISTNAME=	SystemPreferences-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	System Preferences application for GNUstep

LICENSE=	gpl2

USES=		gnustep
USE_GNUSTEP=	back build
DEFAULT_LIBVERSION=	1.0.0
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

MAKE_ENV+=	GNUSTEP_INSTALLATION_DOMAIN=SYSTEM

.include <bsd.port.mk>
