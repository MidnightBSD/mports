# New ports collection makefile for:    pidgin-twitter
# Date created:                         17 May 2008
# Whom:                                 Junji NAKANISHI <jun-g@daemonfreaks.com>
#
# $MidnightBSD$
# $FreeBSD: ports/net-im/pidgin-twitter/Makefile,v 1.2 2008/06/06 13:51:51 edwin Exp $

PORTNAME=	pidgin-twitter
PORTVERSION=	0.6.0
CATEGORIES=	net-im
MASTER_SITES=	http://www.honeyplanet.jp/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A pidgin plugin to help twitting via pidgin
LICENSE=	gpl2

BUILD_DEPENDS=	pidgin:${PORTSDIR}/net-im/pidgin
RUN_DEPENDS=	pidgin:${PORTSDIR}/net-im/pidgin

USE_GNOME=	pkgconfig glib20
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
ALL_TARGET=	default

PLIST_FILES=	lib/pidgin/pidgin-twitter.so

do-install:
	${MKDIR} ${PREFIX}/lib/pidgin
	${CP} ${WRKSRC}/pidgin-twitter.so ${PREFIX}/lib/pidgin/pidgin-twitter.so
	${CHMOD} 755 ${PREFIX}/lib/pidgin/pidgin-twitter.so

.include <bsd.port.mk>
