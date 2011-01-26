# $MidnightBSD: mports/www/kdewebdev/Makefile,v 1.4 2009/05/14 22:53:39 laffer1 Exp $

PORTNAME=	kdewebdev
PORTVERSION=	${KDE_VERSION}
PORTEPOCH=	2
CATEGORIES=	www kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Comprehensive html/website development environment
LICENSE=        gpl2

BUILD_DEPENDS=	cvsservice:${PORTSDIR}/devel/kdesdk3 \
		xgettext:${PORTSDIR}/devel/gettext
RUN_DEPENDS=	cvsservice:${PORTSDIR}/devel/kdesdk3 \
		tidy:${PORTSDIR}/www/tidy

USE_KDELIBS_VER=3
PREFIX=		${KDE_PREFIX}

USE_BZIP2=	yes
USE_XORG=	xpm
USE_GMAKE=	yes
USE_AUTOTOOLS=  libtool:22

.include <${.CURDIR}/../../x11/kde3/Makefile.kde>
.include <bsd.port.mk>
