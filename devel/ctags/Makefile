PORTNAME=	ctags
PORTVERSION=	5.8
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Feature-filled tagfile generator for vi and emacs clones
WWW=		https://ctags.sourceforge.net/

LICENSE=	gpl2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--enable-macro-patterns --with-readlib

USES=	desthack
SUB_FILES+=	pkg-message

.include <bsd.port.mk>
