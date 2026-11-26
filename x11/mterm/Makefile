PORTNAME=	mterm
DISTVERSIONPREFIX=	v
DISTVERSION=	0.1.0
CATEGORIES=	x11

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Midnight Terminal, a GTK4 terminal emulator
WWW=		https://github.com/MidnightBSD/mterm

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cargo gnome pkgconfig
USE_GITHUB=	yes
GH_ACCOUNT=	MidnightBSD
USE_GNOME=	cairo glib20 gtk40 pango

PLIST_FILES=	bin/mterm

.include <bsd.port.mk>
