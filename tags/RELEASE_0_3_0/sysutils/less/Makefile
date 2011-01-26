# New ports collection makefile for:	less
# Date created:		8 Nov 1994
# Whom:			ache
#
# $MidnightBSD: mports/sysutils/less/Makefile,v 1.2 2008/09/15 21:26:31 laffer1 Exp $
# $FreeBSD: ports/sysutils/less/Makefile,v 1.41 2007/01/29 19:05:06 gabor Exp $
#

PORTNAME=	less
PORTVERSION=	382
CATEGORIES=	sysutils
MASTER_SITES=	http://www.greenwoodsoftware.com/%SUBDIR%/ \
		${MASTER_SITE_GNU}
MASTER_SITE_SUBDIR=	less

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A better pager utility
LICENSE=	gpl2

MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/less bin/lesskey bin/lessecho

.include <bsd.port.pre.mk>

GNU_CONFIGURE=	yes
MAN1=		less.1 lesskey.1

MAKE_ENV+=	destdir=${FAKE_DESTDIR}

.if defined(COLOUR_LESS) || defined(COLOR_LESS)
MAKE_ENV+=	CPPFLAGS="-DCOLOUR_LESS"

pre-fetch:
	@${ECHO_MSG} "Making a colour version of less."
.endif

.include <bsd.port.post.mk>
