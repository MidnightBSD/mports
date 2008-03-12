# New ports collection makefile for:	gtar
# Date created:		Sa   6 Jun 1998 10:24:51 CEST
# Whom:			Andreas Klemm <andreas@klemm.gtn.com>
#
# $MidnightBSD: mports/archivers/gtar/Makefile,v 1.5 2008/02/22 04:17:01 laffer1 Exp $
# $FreeBSD: ports/archivers/gtar/Makefile,v 1.47 2006/03/04 14:59:42 naddy Exp $
#

PORTNAME=	tar
PORTVERSION=	1.19
PORTREVISION=	0
CATEGORIES=	archivers sysutils
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}
PKGNAMEPREFIX=	g

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU version of the traditional tar archiver
LICENSE=	gpl3

INFO=		tar

USE_BZIP2=	yes
USE_ICONV=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--program-prefix=g --infodir=${PREFIX}/${INFO_PATH}
CONFIGURE_ENV=	CPPFLAGS='-I${LOCALBASE}/include' \
		LDFLAGS='-L${LOCALBASE}/lib ${LDSTATIC}' \
		DEFAULT_ARCHIVE=/dev/sa0 \
		DEFAULT_RMT_COMMAND=/etc/rmt

.if defined(WANT_STATIC)
LDSTATIC=	-static
.else
LDSTATIC=
.endif

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

# avoid auto framework rebuilds
#post-patch:
#	@${TOUCH} -r ${WRKSRC}/configure.orig ${WRKSRC}/configure

test: build
	@cd ${WRKSRC} && ${MAKE} check

.include <bsd.port.mk>
