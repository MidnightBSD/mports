# New ports collection makefile for:	dbus-qt3
# Date created:				2006-10-18
# Whom:					Maxim Samsonov <xors@sendmail.ru>
#
# $MidnightBSD: mports/devel/dbus-qt3/Makefile,v 1.1 2007/12/30 00:37:36 laffer1 Exp $
# $FreeBSD: ports/devel/dbus-qt3/Makefile,v 1.3 2007/05/19 20:02:20 flz Exp $
#

PORTNAME=	dbus
PORTVERSION=	0.70
PORTREVISION=	2
CATEGORIES=	devel kde
MASTER_SITES=	${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=	distfiles
PKGNAMESUFFIX=	-qt3
DISTNAME=	${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt3 bindings for the D-BUS messaging system
LICENSE=	gpl2

LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus \
		qt-mt:${PORTSDIR}/x11-toolkits/qt33

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ENV=	QTDIR=${LOCALBASE} CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

PLIST_SUB=	VERSION="1.0"

.include <bsd.port.mk>
