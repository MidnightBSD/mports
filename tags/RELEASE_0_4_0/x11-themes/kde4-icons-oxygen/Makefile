# $MidnightBSD: mports/x11-themes/kde4-icons-oxygen/Makefile,v 1.1 2011/07/31 17:08:24 laffer1 Exp $
# $FreeBSD: ports/x11-themes/kde4-icons-oxygen/Makefile,v 1.6 2010/06/01 21:35:38 makc Exp $

PORTNAME=	oxygen
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	x11-themes kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
PKGNAMEPREFIX=	kde4-icons-
DISTNAME=	${PORTNAME}-icons-${PORTVERSION}
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The Oxygen icon theme for KDE
LICENSE=	lgpl3

USE_BZIP2=	yes
USE_KDE4=	kdeprefix kdehier
USE_CMAKE=	yes
INSTALL_TARGET=	install

.include <bsd.port.mk>
