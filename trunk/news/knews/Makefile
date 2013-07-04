# $MidnightBSD: mports/news/knews/Makefile,v 1.5 2013/06/15 20:29:44 laffer1 Exp $

PORTNAME=	knews
PORTVERSION=	1.0b.1
PORTREVISION=	4
CATEGORIES=	news
MASTER_SITES=	${MASTER_SITE_LOCAL}
MASTER_SITE_SUBDIR=dinoex

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A threaded nntp newsreader for X
LICENSE=	gpl2

LIB_DEPENDS=	jpeg:${PORTSDIR}/graphics/jpeg \
		png15:${PORTSDIR}/graphics/png \
		compface:${PORTSDIR}/mail/faces
RUN_DEPENDS=	newsp:${PORTSDIR}/print/mp-letter

USE_IMAKE=	yes
USE_XORG=	xmu xpm xt sm ice xext x11
MAKE_FLAGS=	BINDIR=${PREFIX}/bin MANDIR=${PREFIX}/man/man1 \
		XAPPLOADDIR=${PREFIX}/lib/X11/app-defaults  -f
.if defined(MAKE_JOBS)
MAKE_ARGS+=	-j${MAKE_JOBS}
.endif
MAN1=		knews.1

.include <bsd.port.mk>
