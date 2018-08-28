# New ports collection makefile for:   gtypist
# Date created:	2001-05-18
# Whom:		Christian Weisgerber <naddy@mips.inka.de>
#
# $MidnightBSD$
# $FreeBSD: ports/games/gtypist/Makefile,v 1.17 2004/07/11 10:55:23 krion Exp $

PORTNAME=	gtypist
PORTVERSION=	2.9.5
CATEGORIES=	games
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Interactive typing tutor

LICENSE=	gpl3

USES=		iconv ncurses shebangfix tar:xz
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	EMACS=no
CPPFLAGS+=	-I${LOCALBASE}/include -I${WRKDIR}/include
LDFLAGS+=	-L${LOCALBASE}/libs

INFO=		gtypist gtypist.cs gtypist.es

SHEBANG_FILES=	typefortune

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls

# wide curses header expected at <ncursesw/ncurses.h>
pre-configure:
	@${MKDIR} ${WRKDIR}/include
	@${LN} -sf /usr/include ${WRKDIR}/include/ncursesw

.include <bsd.port.mk>
