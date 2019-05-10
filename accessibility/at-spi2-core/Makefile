# $MidnightBSD$

PORTNAME=	at-spi2-core
PORTVERSION=	2.28.0
CATEGORIES=	accessibility x11-toolkits
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Assistive Technology Service Provider Interface

LICENSE=	lgpl2.1

BUILD_DEPENDS+=	python2.7:lang/python27 \
		ninja:devel/ninja
LIB_DEPENDS=	libdbus-1.so:devel/dbus \
		libxkbcommon.so:x11/libxkbcommon

PORTSCOUT=	limitw:1,even

USES=		gettext gnome localbase meson pkgconfig python:3.5+,build tar:xz
USE_GNOME=	glib20 introspection:build
USE_XORG=	ice sm x11 xi xtst xext
USE_LDCONFIG=	yes

post-install:
	${RM} -r ${STAGEDIR}${PREFIX}/lib/systemd

.include <bsd.port.mk>
