# New ports collection makefile for:	less
# Date created:		8 Nov 1994
# Whom:			ache
#
# $MidnightBSD: mports/sysutils/less/Makefile,v 1.3 2010/01/10 00:58:40 laffer1 Exp $
# $FreeBSD: ports/sysutils/less/Makefile,v 1.41 2007/01/29 19:05:06 gabor Exp $
#

PORTNAME=	less
PORTVERSION=	436
CATEGORIES=	sysutils
MASTER_SITES=	http://www.greenwoodsoftware.com/%SUBDIR%/
#		${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	less

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A better pager utility
LICENSE=	gpl2

MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/less bin/lesskey bin/lessecho

.include <bsd.port.pre.mk>

GNU_CONFIGURE=	yes
MAN1=		less.1 lesskey.1 lessecho.1

.if defined(COLOUR_LESS) || defined(COLOR_LESS)
MAKE_ENV+=	CPPFLAGS="-DCOLOR_LESS"

pre-fetch:
	@${ECHO_MSG} "Making a color version of less."
.endif

.include <bsd.port.post.mk>
