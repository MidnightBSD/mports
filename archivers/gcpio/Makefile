# New ports collection makefile for:   gcpio
# Date created:         30 Jul 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD: mports/archivers/gcpio/Makefile,v 1.1 2007/07/31 01:07:48 laffer1 Exp $

PORTNAME=	cpio
PORTVERSION=	2.9
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	g

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	GNU copy-in/out (cpio)
LICENSE=	gpl3

INFO=	cpio

GNU_CONFIGURE=	yes
USE_GETTEXT=	yes

CONFIGURE_ARGS=	--program-prefix="g" \
		--with-rmt=/etc/rmt \
		--infodir=${PREFIX}/${INFO_PATH}

.include <bsd.port.mk>
