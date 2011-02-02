# Ports collection makefile for:	libsexy
# Date created:				2005-11-06
# Whom:					Andreas Kohn <andreas@syndrom23.de>
#
# $MidnightBSD: mports/x11-toolkits/libsexy/Makefile,v 1.4 2009/12/14 00:14:35 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/libsexy/Makefile,v 1.11 2007/10/09 13:08:28 miwi Exp $
#

PORTNAME=	libsexy
PORTVERSION=	0.1.11
PORTREVISION=	1
CATEGORIES=	x11-toolkits devel
MASTER_SITES=	http://freebsd.unixfreunde.de/sources/ \
		http://releases.chipx86.com/libsexy/libsexy/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extension widgets for GTK+
LICENSE=	lgpl

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/iso-codes.pc:${PORTSDIR}/misc/iso-codes
LIB_DEPENDS=	enchant:${PORTSDIR}/textproc/enchant
RUN_DEPENDS=	${BUILD_DEPENDS}

USE_AUTOTOOLS=	libtool
USE_GNOME=	gnomehack lthack gtk20 libxml2
USE_LDCONFIG=	yes
USE_XORG=	x11
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
