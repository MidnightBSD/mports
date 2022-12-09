# New ports collection makefile for:	lndir
# Date Created:				16 Oct 2007
# Whom:					Lucas Holt <luke@MidnightBSD.org>

PORTNAME=	lndir
PORTVERSION=	1.0.4
CATEGORIES=	devel
DISTFILES=      ${PORTNAME}-${PORTVERSION}.tar.xz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Create a shadow directory of symbolic links to another directory tree

LICENSE=	mit

USE_XORG=	xorgproto
USES=		xorg xorg-cat:util tar:xz

PLIST_FILES=	bin/lndir \
		man/man1/lndir.1.gz

.include <bsd.port.mk>
