# New ports collection makefile for:   gcpio
# Date created:         30 Jul 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$

PORTNAME=	cpio
PORTVERSION=	2.9
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	g

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	GNU copy-in/out (cpio)

INFO=	cpio

GNU_CONFIGURE=	yes
USE_GETTEXT=	yes

CONFIGURE_ARGS=	--program-prefix="g" \
		--with-rmt=/etc/rmt \
		--infodir=${PREFIX}/${INFO_PATH}

.include <bsd.port.mk>
