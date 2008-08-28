# New ports collection makefile for:	kde-xdg-env
# Date created:				April 03 2005
# Whom:					Michael Nottebrock <lofi@FreeBSD.org>
#
# $FreeBSD: ports/misc/kde-xdg-env/Makefile,v 1.3 2006/06/21 03:34:00 lofi Exp $
# $MidnightBSD: mports/misc/kde-xdg-env/Makefile,v 1.1 2006/11/24 18:35:29 laffer1 Exp $
#

PORTNAME=	xdg
PORTVERSION=	1.0
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	misc kde
MASTER_SITES=	# none
PKGNAMEPREFIX=	kde-
PKGNAMESUFFIX=	-env
DISTNAME=	# none
EXTRACT_SUFX=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Script which hooks into startkde and helps KDE pick up XDG apps/menus
LICENSE=	unknown

.if defined(KDE_PREFIX)
PREFIX=		${KDE_PREFIX}
SUB_LIST+=	KDE_PREFIX=${KDE_PREFIX}
.else
SUB_LIST+=	KDE_PREFIX=${LOCALBASE}
.endif

NO_BUILD=	yes

SUB_FILES=	xdg-env.sh

PLIST_FILES=	env/xdg-env.sh
PLIST_DIRS=	env

do-install:
	${MKDIR} ${PREFIX}/env
	${INSTALL_SCRIPT} ${WRKDIR}/xdg-env.sh ${PREFIX}/env

.include <bsd.port.mk>
