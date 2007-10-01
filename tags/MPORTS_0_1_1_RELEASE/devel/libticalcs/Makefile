# New ports collection makefile for:	libticalcs
# Date created:		27 August 2003
# Whom:			Tijl Coosemans <tijl@ulyssis.org>
#
# $MidnightBSD$
# $FreeBSD: ports/devel/libticalcs/Makefile,v 1.15 2006/10/05 15:18:42 clsung Exp $
#

PORTNAME=	libticalcs
PORTVERSION=	4.6.1
CATEGORIES=	devel
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	tilp

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	TI calculator library

LIB_DEPENDS=	ticables.12:${PORTSDIR}/comms/libticables \
		tifiles.6:${PORTSDIR}/devel/libtifiles

USE_GETTEXT=	yes
USE_GNOME=	gnomehack pkgconfig
USE_AUTOTOOLS=	libtool:15
USE_GMAKE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
