PORTNAME=	aterm
PORTVERSION=	1.0.1
PORTREVISION=	1
CATEGORIES=	chinese x11
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Color vt102 terminal emulator with transparency support
WWW=		https://aterm.sourceforge.net/

LICENSE=	mit

USES=		cpe xorg
USE_XORG=	xpm
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--enable-xim --enable-big5
MAKE_JOBS_UNSAFE=	yes

CONFLICTS_INSTALL=	aterm

PLIST_FILES=	"@(,,4711) bin/aterm" \
		share/man/man1/aterm.1.gz

.include <bsd.port.mk>
