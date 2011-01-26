# New ports collection makefile for:	gawk
# Date created:		Mi  21 Okt 1998 13:53:18 CEST
# Whom:			Andreas Klemm <andreas@klemm.gtn.com>
#
# $FreeBSD: ports/lang/gawk/Makefile,v 1.19 2004/07/11 10:30:37 krion Exp $
# $MidnightBSD: mports/lang/gawk/Makefile,v 1.3 2008/05/13 03:42:20 laffer1 Exp $

PORTNAME=	gawk
PORTVERSION=	3.1.6
CATEGORIES=	lang
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	gawk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GNU version of Awk
LICENSE=	gpl2

INFO=		gawk gawkinet

.include <bsd.port.pre.mk>

EXTRA_PATCHES=	${PATCHDIR}/extra-patch-nowchar

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libiconv-prefix=${LOCALBASE} \
		--with-libintl-prefix=${LOCALBASE}
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0
MAN1=		gawk.1 igawk.1 pgawk.1

PLIST_SUB=	VERSION=${PORTVERSION}

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.post.mk>
