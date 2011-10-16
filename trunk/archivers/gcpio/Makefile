# New ports collection makefile for:   gcpio
# Date created:         30 Jul 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/archivers/gcpio/Makefile,v 1.2 2008/03/12 01:38:10 laffer1 Exp $

PORTNAME=	cpio
PORTVERSION=	2.11
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	g

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	GNU copy-in/out (cpio)
LICENSE=	gpl3

INFO=	cpio

USE_BZIP2=	yes
MAKE_JOBS_SAFE=	yes
GNU_CONFIGURE=	yes
USE_GETTEXT=	yes

CONFIGURE_ARGS=	--program-prefix="g" \
		--with-rmt=/etc/rmt \
		--infodir=${PREFIX}/${INFO_PATH}

.if !defined(WITHOUT_NLS)
PLIST_SUB+=   NLS=""
CONFIGURE_ARGS+=--with-libintl-prefix="${LOCALBASE}"
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=   NLS="@comment "
.endif

.include <bsd.port.mk>
