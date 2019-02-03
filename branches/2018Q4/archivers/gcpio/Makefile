# New ports collection makefile for:   gcpio
# Date created:         30 Jul 2007
# Whom:                 Lucas Holt <luke@MidnightBSD.org>
#
# $MidnightBSD$

PORTNAME=	cpio
PORTVERSION=	2.12
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	g

MAINTAINER=	luke@MidnightBSD.org
COMMENT=	GNU copy-in/out (cpio)

LICENSE=	gpl3

INFO=	cpio

USES=		gettext tar:bzip2
GNU_CONFIGURE=	yes

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
