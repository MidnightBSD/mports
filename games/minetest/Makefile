# Created by: Dmitry Marakasov <amdmi3@FreeBSD.org>
# $MidnightBSD$
# $FreeBSD: head/games/minetest/Makefile 390310 2015-06-22 18:33:20Z antoine $

PORTNAME=	minetest
PORTVERSION=	0.4.12
PORTREVISION=	1
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Infiniminer/Minecraft inspired game

LICENSE=	lgpl2.1 # or later
LICENSE_FILE=	${WRKSRC}/doc/lgpl-2.1.txt

LIB_DEPENDS=	libsqlite3.so:${PORTSDIR}/databases/sqlite3

USE_GITHUB=	yes
GH_ACCOUNT=	minetest

WRKSRC=		${WRKDIR}/minetest-${PORTVERSION}

USES=		cmake jpeg openal
CMAKE_ARGS+=	-DCUSTOM_MANDIR="${TRUE_PREFIX}/man" \
		-DCUSTOM_EXAMPLE_CONF_DIR="${TRUE_PREFIX}/etc" \
		-DIRRLICHT_INCLUDE_DIR="/usr/local/include/irrlicht"

PORTDATA=	*
PORTDOCS=	*


CMAKE_ARGS+=	-DBUILD_CLIENT=1
LIB_DEPENDS+=	libpng.so:${PORTSDIR}/graphics/png \
		libIrrlicht.so:${PORTSDIR}/x11-toolkits/irrlicht
USE_OPENAL=	yes
USE_XORG=	x11
USE_GL=		gl
CMAKE_ARGS+=	-DBUILD_SERVER=1
CMAKE_ARGS+=		-DENABLE_CURL=1
LIB_DEPENDS+=	libcurl.so:${PORTSDIR}/ftp/curl
CMAKE_ARGS+=		-DENABLE_GETTEXT=0
CMAKE_ARGS+=		-DENABLE_SOUND=1
CMAKE_ARGS+=	-DENABLE_FREETYPE=1
LIB_DEPENDS+=	libfreetype.so:${PORTSDIR}/print/freetype2
LIB_DEPENDS+=	libluajit-5.1.so:${PORTSDIR}/lang/luajit

.include <bsd.mport.options.mk>

LIB_DEPENDS+=	libvorbis.so:${PORTSDIR}/audio/libvorbis

USE_RC_SUBR=	${PORTNAME}
USERS=		${PORTNAME}
GROUPS=		${PORTNAME}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${FAKE_DESTDIR}${LOCALBASE}|' \
		${WRKSRC}/cmake/Modules/*.cmake
.if ! ${PORT_OPTIONS:MLUAJIT}
	@${REINPLACE_CMD} -e '/find_/ s|LUA_|NO&|g' \
		${WRKSRC}/src/CMakeLists.txt
.endif

#do-install:
 	#${INSTALL_PROGRAM} ${WRKSRC}/bin/minetest ${PREFIX}/bin/
#	${INSTALL_PROGRAM} ${WRKSRC}/bin/minetestserver ${PREFIX}/bin/
#	${INSTALL_DATA} ${WRKSRC}/minetest.conf.example ${PREFIX}/etc/minetest.conf.example
#	${INSTALL_MAN} man/man6/minetest.6.gz
#	${INSTALL_MAN} man/man6/minetestserver.6.gz
#	${INSTALL_DATA} ${WRKSRC}/misc/minetest.desktop ${PREFIX}/share/applications/minetest.desktop
#	${INSTALL_DATA} ${WRKSRC}/misc/minetest.appdata.xml share/appdata/minetest.appdata.xml
#	${INSTALL_DATA} ${WRKSRC}/misc/mimetest-icon.svg share/icons/hicolor/scalable/apps/minetest-icon.svg

.include <bsd.port.post.mk>
