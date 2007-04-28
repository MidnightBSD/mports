# New ports collection makefile for:	linux-hicolor-icon-theme
# Date created:		7 February 2006
# Whom:			Andrew Pantyukhin <infofarmer@FreeBSD.org>
#
# $MidnightBSD: mports/x11-themes/linux-hicolor-icon-theme/Makefile,v 1.2 2007/04/19 15:53:42 laffer1 Exp $
# $FreeBSD: ports/x11-themes/linux-hicolor-icon-theme/Makefile,v 1.4 2006/05/08 21:41:11 sat Exp $
#

PORTNAME=	hicolor-icon-theme
PORTVERSION=	0.5
CATEGORIES=	x11-themes linux
MASTER_SITES=	# empty
PKGNAMEPREFIX=	linux-
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A high-color icon theme shell from the FreeDesktop project

RUN_DEPENDS=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

NO_BUILD=	yes
USE_LINUX=	yes
USE_LINUX_PREFIX=	yes
PLIST_FILES=	usr/share/icons/hicolor
PLIST_DIRS=	usr/share/icons

do-install:
	${INSTALL} -d ${PREFIX}/usr/share/icons
	${LN} -fs ${LOCALBASE}/share/icons/hicolor ${PREFIX}/usr/share/icons

.include <bsd.port.mk>
