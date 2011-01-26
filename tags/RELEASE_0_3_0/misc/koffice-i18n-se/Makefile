# New ports collection makefile for:	koffice-i18n-se
# Date created:                         21 January 2004
# Whom:                                 Brad Davis <so14k@so14k.com>
#
# $MidnightBSD: mports/misc/koffice-i18n-se/Makefile,v 1.1 2007/12/30 17:10:46 laffer1 Exp $
# $FreeBSD: ports/misc/koffice-i18n-se/Makefile,v 1.27 2007/11/08 19:12:44 lofi Exp $
#

PORTNAME=	koffice-i18n
PORTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES?=	misc kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	Attic/koffice-${PORTVERSION}/src/koffice-l10n
PKGNAMEPREFIX=	se-
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Northern Sami messages and documentation for koffice
LICENSE=	unknown

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext

USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
KDE_I18N=	yes
USE_AUTOTOOLS=	autoconf:262

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
