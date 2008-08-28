# New ports collection makefile for:	kdeaccessibility
# Date created:				19 Jan 2004 18:40:32 EST
# Whom:					Will Andrews <will@FreeBSD.org>
#
# $FreeBSD: ports/accessibility/kdeaccessibility/Makefile,v 1.19 2006/09/12 23:26:11 lofi Exp $
# $MidnightBSD: mports/accessibility/kdeaccessibility/Makefile,v 1.2 2007/08/07 22:48:54 laffer1 Exp $
#

PORTNAME=	kdeaccessibility
PORTVERSION=	${KDE_VERSION}
CATEGORIES=	accessibility kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Accessibility applications for KDE
LICENSE=	gpl2

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool:15
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
