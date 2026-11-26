PORTNAME=	mterm
DISTVERSIONPREFIX=	v
DISTVERSION=	0.1.1
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Midnight Terminal, a GTK4 terminal emulator
WWW=		https://github.com/MidnightBSD/mterm

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cargo desktop-file-utils gnome pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	MidnightBSD
USE_GNOME=	cairo glib20 gtk40 pango

PLIST_FILES=	bin/mterm \
		share/applications/org.midnightbsd.mterm.desktop

post-install:
	${INSTALL_DATA} ${WRKSRC}/data/org.midnightbsd.mterm.desktop \
		${PREFIX}/share/applications/

.include <bsd.port.mk>
