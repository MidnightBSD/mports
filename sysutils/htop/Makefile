# Created by: Tony Shadwick <tshadwick@oss-solutions.com>

PORTNAME=	htop
DISTVERSION=	3.0.4
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Better top(1) - interactive process viewer

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		autoreconf compiler:c11 libtool localbase ncurses pkgconfig \
		python:build shebangfix

USE_GITHUB=	yes
GH_ACCOUNT=	htop-dev

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-unicode
CONFIGURE_TARGET=	${ARCH}-portbld-freebsd11.4

PLIST_FILES=	bin/htop \
		man/man1/htop.1.gz \
		share/applications/htop.desktop \
		share/icons/hicolor/scalable/apps/htop.svg \
		share/pixmaps/htop.png

OPTIONS_DEFINE=		LSOF
OPTIONS_DEFAULT=	LSOF

LSOF_RUN_DEPENDS=	lsof:sysutils/lsof

.include <bsd.port.mk>
