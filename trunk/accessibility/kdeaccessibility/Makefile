# $MidnightBSD: mports/accessibility/kdeaccessibility/Makefile,v 1.5 2009/09/19 23:52:26 laffer1 Exp $

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

USE_XORG=	xtst
USE_BZIP2=	yes
USE_AUTOTOOLS=  libtool
USE_GMAKE=	yes
GNU_CONFIGURE=	yes

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
