# New ports collection makefile for:	koffice-i18n-cy
# Date created:                         November 18th, 2004
# Whom:                                 Michael Nottebrock <lofi@freebsd.org>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/koffice-i18n-cy/Makefile,v 1.16 2007/10/29 23:47:59 lofi Exp $
#

PORTNAME=	koffice-i18n
PORTVERSION=	1.6.3
CATEGORIES?=	misc kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/koffice-${PORTVERSION}/src/koffice-l10n
PKGNAMEPREFIX=	cy-
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Welsh messages and documentation for koffice
LICENSE=	unknown

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext

USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
KDE_I18N=	yes

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
