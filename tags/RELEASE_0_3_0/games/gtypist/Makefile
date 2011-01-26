# New ports collection makefile for:   gtypist
# Date created:	2001-05-18
# Whom:		Christian Weisgerber <naddy@mips.inka.de>
#
# $MidnightBSD: mports/games/gtypist/Makefile,v 1.2 2008/03/22 18:31:53 laffer1 Exp $
# $FreeBSD: ports/games/gtypist/Makefile,v 1.17 2004/07/11 10:55:23 krion Exp $

PORTNAME=	gtypist
PORTVERSION=	2.8.3
CATEGORIES=	games
MASTER_SITES=	${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactive typing tutor
LICENSE=	gpl2

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	EMACS=no
MAKE_JOBS_SAFE=	yes

INFO=		gtypist
MAN1=		gtypist.1 typefortune.1

.if !defined(WITHOUT_NLS)
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
