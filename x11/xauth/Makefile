PORTNAME=	xauth
PORTVERSION=	1.1.4
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X authority file utility

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

TEST_DEPENDS=	cmdtest:devel/py-cmdtest

USES=		shebangfix tar:xz xorg xorg-cat:app
USE_XORG=	x11 xau xext xmuu
INSTALL_TARGET=	install-strip
TEST_TARGET=	check
SHEBANG_FILES=	${WRKSRC}/tests/*.script
SHEBANG_LANG=	nobash
nobash_OLD_CMD=	/bin/bash
nobash_CMD=	/bin/sh

PLIST_FILES=	bin/xauth share/man/man1/xauth.1.gz

.include <bsd.port.mk>
