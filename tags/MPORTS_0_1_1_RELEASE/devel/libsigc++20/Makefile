# New ports collection makefile for:   libsigc++2
# Date created:        14 Feb 2004
# Whom:                Alexander Nedotsukov <bland@FreeBSD.org>
#
# $MidnightBSD: mports/devel/libsigc++20/Makefile,v 1.1 2006/09/27 18:36:13 laffer1 Exp $
# $FreeBSD: ports/devel/libsigc++20/Makefile,v 1.41 2006/05/04 21:40:52 edwin Exp $
#

PORTNAME=	libsigc++
PORTVERSION=	2.0.17
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/libsigc++/${PORTVERSION:R}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Callback Framework for C++

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_BZIP2=	yes
USE_GCC=	3.4
USE_GMAKE=	yes
LATEST_LINK=	libsigc++20
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes

PLIST_SUB=	VERSION="2.0" API_VERSION="2.0"

post-patch:
	@${REINPLACE_CMD} -e "/^SUBDIRS =/s|tests||; \
		/^SUBDIRS =/s|examples||" ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
