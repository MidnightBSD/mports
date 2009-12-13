# New ports collection makefile for:	gnomeuserdocs2
# Date created:        			07 July 2002
# Whom:					Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $MidnightBSD: mports/misc/gnome-user-docs/Makefile,v 1.3 2008/09/21 20:13:42 laffer1 Exp $
# $FreeBSD: ports/misc/gnome-user-docs/Makefile,v 1.31 2007/07/03 06:21:50 marcus Exp $
#   $MCom: ports/misc/gnome-user-docs/Makefile,v 1.33 2007/03/13 00:11:38 marcus Exp $
#

PORTNAME=	gnome-user-docs
PORTVERSION=	2.26.2
CATEGORIES=	misc gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNOME 2 users guide
LICENSE=	other

BUILD_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian
RUN_DEPENDS=	rarian-sk-config:${PORTSDIR}/textproc/rarian

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
INSTALLS_OMF=	yes
USE_GNOME=	gnomeprefix gnomehack gnomehier gnomedocutils

.include <bsd.port.mk>
