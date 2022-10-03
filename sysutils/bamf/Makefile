PORTNAME=	bamf
PORTVERSION=	0.5.6
CATEGORIES=	sysutils
MASTER_SITES=	https://launchpad.net/${PORTNAME}/${PORTVERSION:R}/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	BAMF Application Matching Framework
WWW=		https://launchpad.net/bamf

LICENSE=	lgpl3
LICENSE_FILE=	${WRKSRC}/COPYING.LGPL

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}lxml>=4.4.2:devel/py-lxml@${PY_FLAVOR}
LIB_DEPENDS=	libgtop-2.0.so:devel/libgtop \
	libstartup-notification-1.so:x11/startup-notification \
	libharfbuzz.so:print/harfbuzz

USES=		compiler:c11 gettext-runtime gmake gnome libtool pathfix \
		pkgconfig python:3.6+,build vala:build xorg
GNU_CONFIGURE=	yes
USE_GNOME=	gtk30 glib20 introspection:build libwnck3 cairo gdkpixbuf2
USE_XORG=	x11
INSTALL_TARGET=	install-strip

CONFIGURE_ARGS+=--disable-headless-tests \
	--disable-gtktest \
	--disable-gcov \
	--disable-gtk-doc-html \
	--without-html-dir \
	--enable-export-actions-menu=no \
	--enable-introspection=yes

post-patch:
	${REINPLACE_CMD} -e 's| -Wl,-Bsymbolic-functions||' \
		${WRKSRC}/src/Makefile.in

.include <bsd.port.mk>
