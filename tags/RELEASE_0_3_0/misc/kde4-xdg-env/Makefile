#
# $MidnightBSD: ports/misc/kde4-xdg-env/Makefile,v 1.7 2008/08/09 16:52:18 miwi Exp $
#

PORTNAME=	xdg
PORTVERSION=	1.0
CATEGORIES=	misc kde
MASTER_SITES=	# none
PKGNAMEPREFIX=	kde4-
PKGNAMESUFFIX=	-env
DISTNAME=	# none
EXTRACT_SUFX=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Script which hooks into startkde and helps KDE pick up XDG apps/menus
LICENSE=	unknown

USE_KDE4=	kdeprefix

SUB_LIST+=	KDE4_PREFIX=${KDE4_PREFIX}

NO_BUILD=	yes

SUB_FILES=	xdg-env.sh

PLIST_FILES=	env/xdg-env.sh
PLIST_DIRS=	env

do-install:
	${MKDIR} ${PREFIX}/env
	${INSTALL_SCRIPT} ${WRKDIR}/xdg-env.sh ${PREFIX}/env

.include <bsd.port.mk>
