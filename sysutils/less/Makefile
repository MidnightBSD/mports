# $MidnightBSD: mports/sysutils/less/Makefile,v 1.5 2013/02/22 00:29:48 laffer1 Exp $

PORTNAME=	less
PORTVERSION=	458
CATEGORIES=	sysutils
MASTER_SITES=	http://www.greenwoodsoftware.com/%SUBDIR%/ \
		${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	less

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A better pager utility
LICENSE=	gpl3

OPTIONS_DEFINE=	COLOR_LESS
COLOR_LESS_DESC=Enables color support via escape sequence

PLIST_FILES=	bin/less bin/lesskey bin/lessecho

.include <bsd.mport.options.mk>

GNU_CONFIGURE=	yes
MAN1=		less.1 lesskey.1 lessecho.1

.if ${PORT_OPTIONS:MCOLOUR_LESS}
CPPFLAGS+=	-DCOLOR_LESS

pre-fetch:
	@${ECHO_MSG} "Making a color version of less."
.endif

.include <bsd.port.mk>
