# $MidnightBSD$

PORTNAME=	ctags
PORTVERSION=	5.7
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A feature-filled tagfile generator for vi and emacs clones
LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-macro-patterns --with-readlib

MAN1=		exctags.1

FAKE_OPTS=	prefixhack

.include <bsd.port.mk>
