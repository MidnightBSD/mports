# $MidnightBSD$

PORTNAME=	ctags
PORTVERSION=	5.8
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Feature-filled tagfile generator for vi and emacs clones

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-macro-patterns --with-readlib

SUB_FILES+=	pkg-message
FAKE_OPTS=	prefixhack

.include <bsd.port.mk>
