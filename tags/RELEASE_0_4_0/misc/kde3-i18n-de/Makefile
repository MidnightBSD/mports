# New ports collection makefile for: misc/kde3-i18n-de
# Date created: 5 August 2007
# Whom: Stevan Tiefert
#
# $MidnightBSD: mports/misc/kde3-i18n-de/Makefile,v 1.2 2008/06/16 22:02:26 stevan Exp $
#

PORTNAME=	kde3-i18n-de
DISTNAME=	kde-i18n-de-3.5.10
PORTVERSION=	3.5.10
PORTREVISION=	0
CATEGORIES=	misc german kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION:S/.0//}/src/kde-i18n

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	German translations for KDE
LICENSE=	gpl2

USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
KDE_I18N=	yes
WRKSRC=		${WRKDIR}/kde-i18n-de-3.5.10

.include <bsd.port.mk>
