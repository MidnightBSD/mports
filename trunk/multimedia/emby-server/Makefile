# Created by: Ben Woods <woodsb02@FreeBSD.org>
# $FreeBSD: head/multimedia/emby-server/Makefile 421111 2016-08-30 12:44:27Z woodsb02 $
# $MidnightBSD$

PORTNAME=	emby-server
PORTVERSION=	3.5.3.0
CATEGORIES=	multimedia
MASTER_SITES=	https://github.com/MediaBrowser/Emby.Releases/releases/download/${PORTVERSION}/
DISTNAME=	emby-server-freebsd_${PORTVERSION}_amd64

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Home media server built using mono and other open source technologies

LICENSE=	UNKNOWN
LICENSE_NAME=	custom
LICENSE_FILE=	${WRKSRC}/license.docx
LICENSE_PERMS=	dist-mirror no-dist-sell pkg-mirror no-pkg-sell auto-accept

ONLY_FOR_ARCHS=	amd64

RUN_DEPENDS=	mono:lang/mono
LIB_DEPENDS=	libass.so:multimedia/libass \
		libfontconfig.so:x11-fonts/fontconfig \
		libfreetype.so:print/freetype2 \
		libfribidi.so:converters/fribidi \
		libgnutls.so:security/gnutls \
		libopus.so:audio/opus \
		libsmbclient.so:net/samba44 \
		libsqlite3.so:databases/sqlite3 \
		libtheora.so:multimedia/libtheora \
		libva.so:multimedia/libva \
		libvorbis.so:audio/libvorbis \
		libwebp.so:graphics/webp \
		libx264.so:multimedia/libx264 \
		libzvbi.so:devel/libzvbi

USES=		iconv:wchar_t tar:xz
USE_XORG=	x11 xcb

NO_BUILD=	true
WRKSRC=		${WRKDIR}/emby-server-${PORTVERSION}

USE_RC_SUBR=	${PORTNAME}
SUB_LIST=	PORTNAME=${PORTNAME} USER=${USERS} GROUP=${GROUPS} RC_NAME=emby_server
USERS=		emby
GROUPS=		emby

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/emby-server
	(cd ${WRKSRC}/bin && ${COPYTREE_BIN} . ${STAGEDIR}${PREFIX}/lib/emby-server/bin)
	(cd ${WRKSRC}/lib && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/lib/emby-server/lib)
	(cd ${WRKSRC}/system && ${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/lib/emby-server/system)
	(cd ${STAGEDIR}${PREFIX}/lib/emby-server/system && \
		ln -s ../../libsqlite3.so ./libsqlite3.so && \
		ln -s ../lib/libSkiaSharp.so ./libSkiaSharp.so)

.include <bsd.port.mk>
