# $MidnightBSD: mports/sysutils/less/Makefile,v 1.6 2013/06/05 02:35:19 laffer1 Exp $

PORTNAME=	less
PORTVERSION=	458
CATEGORIES=	sysutils
MASTER_SITES=	http://www.greenwoodsoftware.com/%SUBDIR%/ \
		${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	less

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Better pager utility
LICENSE=	gpl3

GNU_CONFIGURE=	yes

MAN1=		less.1 lesskey.1 lessecho.1
PLIST_FILES=	bin/less bin/lesskey bin/lessecho

OPTIONS_DEFINE=	COLORS
COLORS_DESC=	Enable colors support via escape sequence

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCOLORS}
CPPFLAGS+=	-DCOLOR_LESS

pre-fetch:
	@${ECHO_MSG} "Making a color version of less."
.endif

.include <bsd.port.mk>
