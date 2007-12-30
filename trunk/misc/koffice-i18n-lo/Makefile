# New ports collection makefile for:	koffice-i18n-lo
# Date created:                         21 January 2004
# Whom:                                 Brad Davis <so14k@so14k.com>
#
# $MidnightBSD$
# $FreeBSD: ports/misc/koffice-i18n-lo/Makefile,v 1.26 2007/10/29 23:48:02 lofi Exp $
#

PORTNAME=	koffice-i18n
PORTVERSION=	1.3.5
PORTREVISION=	1
CATEGORIES?=	misc kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	Attic/koffice-${PORTVERSION:S/.0//}/src/
PKGNAMEPREFIX=	lo-
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lao messages and documentation for koffice
LICENSE=	unknown

BUILD_DEPENDS=	xgettext:${PORTSDIR}/devel/gettext

USE_KDELIBS_VER=3
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
KDE_I18N=	yes

.include "${.CURDIR}/../../x11/kde3/Makefile.kde"

.include <bsd.port.mk>
