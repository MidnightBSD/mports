PORTNAME=	keybinder
PORTVERSION=	0.3.2
DISTVERSIONPREFIX=	keybinder-3.0-v
PORTREVISION=	1
CATEGORIES=	x11
MASTER_SITES=	https://github.com/kupferlauncher/${PORTNAME}/releases/download/${DISTVERSIONPREFIX}${DISTVERSION}/
PKGNAMESUFFIX=	-gtk3
DISTNAME=	${DISTVERSIONPREFIX:S/-v//}-${DISTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for registering keyboard shortcuts

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext-runtime gmake gnome libtool pathfix pkgconfig xorg
USE_GNOME=	gtk30 introspection:build cairo gdkpixbuf
USE_XORG=	x11 xext xrender
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

PLIST_SUB=	VERSION="3.0"

.include <bsd.port.mk>
