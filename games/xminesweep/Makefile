PORTNAME=	xminesweep
PORTVERSION=	3.0
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://web.warwick.ac.uk/ftp/pub/x11/ \
		ftp://ftp.netlab.is.tsukuba.ac.jp/pub/X/our_collections/games/ \
		ftp://ftp.uni-halle.de/pub/X11/contrib/games/ \
		ftp://ftp.eunet.ch/software/X/games/
DISTNAME=	${PORTNAME}${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 minesweeper game

LICENSE=	xminesweep
LICENSE_NAME=	xminesweep
LICENSE_TEXT=	noncommercial distribution only.
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept

USES=		imake tar:Z
USE_XORG=	x11 xext xmu xaw xt xpm sm ice
PLIST_FILES=	bin/xminesweep share/man/man1/xminesweep.1.gz

.include <bsd.port.mk>
