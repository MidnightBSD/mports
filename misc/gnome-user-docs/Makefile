# $MidnightBSD: mports/misc/gnome-user-docs/Makefile,v 1.6 2011/08/20 14:00:05 laffer1 Exp $

PORTNAME=	gnome-user-docs
PORTVERSION=	2.32.0
PORTREVISION=	1
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 users guide
LICENSE=	other

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USES=		pkgconfig
USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
USE_GNOME=	gnomeprefix gnomehack gnomehier gnomedocutils

.include <bsd.port.mk>
