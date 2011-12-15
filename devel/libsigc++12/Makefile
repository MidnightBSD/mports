# New ports collection makefile for:   libsigc++
# Date created:        30 September 2002
# Whom:                Martin Klaffenboeck <martin.klaffenboeck@gmx.at>
#
# $MidnightBSD: mports/devel/libsigc++12/Makefile,v 1.3 2008/10/07 05:39:11 ctriv Exp $
# $FreeBSD: ports/devel/libsigc++12/Makefile,v 1.32 2006/05/16 04:27:42 mezz Exp $
#

PORTNAME=	libsigc++
PORTVERSION=	1.2.7
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME:S/$/:gnome/} \
		${MASTER_SITE_SOURCEFORGE:S/$/:sf/}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.2/:gnome \
		libsigc/:sf
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:sf,gnome
DIST_SUBDIR=	gnome2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Callback Framework for C++
LICENSE=	lgpl

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_GMAKE=	yes
LATEST_LINK=	libsigc++12
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
