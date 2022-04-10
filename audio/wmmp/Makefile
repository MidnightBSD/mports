# Created by: Nicolas Herry <nicolasherry@gmail.com>

PORTNAME=	wmmp
PORTVERSION=	0.12.6
CATEGORIES=	audio windowmaker

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Dockable musicpd client applet for Window Maker

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake xorg
USE_GITHUB=	yes
GH_ACCOUNT=	yogsothoth
USE_XORG=	xpm x11 xext

PLIST_FILES=	bin/WMmp man/man1/WMmp.1.gz

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/WMmp

.include <bsd.port.mk>
