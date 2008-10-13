# New ports collection makefile for:	Quanta+
# Date created:				26 Sep 2002
# Whom:					AlanE <alane@freebsd.org>
#
# $FreeBSD: ports/www/kdewebdev/Makefile,v 1.55 2006/09/12 23:26:48 lofi Exp $
# $MidnightBSD: mports/www/kdewebdev/Makefile,v 1.2 2007/12/31 05:13:43 laffer1 Exp $
#

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
USE_XPM=	yes
USE_GMAKE=	yes
USE_AUTOTOOLS=  libtool:15

.include <${.CURDIR}/../../x11/kde3/Makefile.kde>
.include <bsd.port.mk>
