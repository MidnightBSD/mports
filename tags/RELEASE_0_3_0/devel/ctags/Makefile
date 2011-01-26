# $MidnightBSD: mports/devel/ctags/Makefile,v 1.2 2009/04/08 20:44:01 laffer1 Exp $

PORTNAME=	ctags
PORTVERSION=	5.8
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A feature-filled tagfile generator for vi and emacs clones
LICENSE=	gpl2

MAKE_JOBS_SAFE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-macro-patterns --with-readlib

MAN1=		exctags.1
SUB_FILES+=	pkg-message
FAKE_OPTS=	prefixhack

.include <bsd.port.mk>
