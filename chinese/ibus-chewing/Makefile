PORTNAME=	ibus-chewing
PORTVERSION=	1.5.1
PORTREVISION=	1
CATEGORIES=	chinese

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Chewing engine for IBus
WWW=		https://github.com/definite/ibus-chewing

LICENSE=	gpl2

BUILD_DEPENDS=	gob2:devel/gob2 \
		${LOCALBASE}/share/cmake/Modules/ManageEnvironmentCommon.cmake:devel/cmake-fedora \
		ibus-daemon:textproc/ibus
LIB_DEPENDS=	libchewing.so:chinese/libchewing
RUN_DEPENDS=	ibus-daemon:textproc/ibus

CMAKE_ARGS=	-DSYSCONF_INSTALL_DIR=${PREFIX}/etc \
		-DLIB_DIR=${PREFIX}/lib
LDFLAGS+=	-L${LOCALBASE}/lib
GLIB_SCHEMAS=	org.freedesktop.IBus.Chewing.gschema.xml
USES=		cmake:noninja gettext gnome pkgconfig xorg
USE_GNOME=	gtk20
USE_XORG=	xtst

PLIST_SUB=	PORTVERSION=${PORTVERSION}

USE_GITHUB=	yes
GH_ACCOUNT=	definite

.include <bsd.port.mk>
