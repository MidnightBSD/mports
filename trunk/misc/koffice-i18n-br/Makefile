# New ports collection makefile for:	koffice-i18n-br
# Date created:                         November 18th, 2004
# Whom:                                 Michael Nottebrock <lofi@freebsd.org>
#
# $MidnightBSD: mports/misc/koffice-i18n-br/Makefile,v 1.2 2011/01/15 03:40:46 laffer1 Exp $
# $FreeBSD: ports/misc/koffice-i18n-br/Makefile,v 1.18 2007/11/08 19:12:43 lofi Exp $
#

PORTNAME=	koffice-i18n
PORTVERSION=	1.5.2
PORTREVISION=	1
CATEGORIES?=	misc kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	Attic/koffice-${PORTVERSION}/src/koffice-l10n
PKGNAMEPREFIX=	br-
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Breton messages and documentation for koffice
LICENSE=	unknown

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext

USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
KDE_I18N=	yes
USE_AUTOTOOLS=	autoconf

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
