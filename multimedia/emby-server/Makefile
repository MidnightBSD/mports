# Created by: Ben Woods <woodsb02@FreeBSD.org>
# $FreeBSD: head/multimedia/emby-server/Makefile 421111 2016-08-30 12:44:27Z woodsb02 $
# $MidnightBSD$

PORTNAME=	emby-server
PORTVERSION=	3.0.6400
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Home media server built using mono and other open source technologies

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/LICENSE.md

LIB_DEPENDS=	libavformat.so:${PORTSDIR}/multimedia/ffmpeg

CONFLICTS_INSTALL=	mediabrowser

USE_GITHUB=	yes
GH_ACCOUNT=	MediaBrowser
GH_PROJECT=	Emby

USES=		mono pkgconfig sqlite
NO_ARCH=	yes

USE_RC_SUBR=	${PORTNAME}
RC_NAME=	emby_server
SUB_LIST=	PORTNAME=${PORTNAME} USER=${USERS} GROUP=${GROUPS} RC_NAME=${RC_NAME}
USERS=		emby
GROUPS=		emby

OPTIONS_DEFINE=		X11
OPTIONS_DEFAULT=	X11
X11_LIB_DEPENDS=	libMagickWand-6.so:${PORTSDIR}/graphics/ImageMagick
X11_LIB_DEPENDS_OFF=	libMagickWand-6.so:${PORTSDIR}/graphics/ImageMagick-nox11

do-build:
	(cd ${WRKSRC} && \
		${SETENV} ${MAKE_ENV} ${LOCALBASE}/bin/xbuild /t:build /p:Configuration="Release Mono" \
			/p:Platform="Any CPU" MediaBrowser.Mono.sln)

do-install:
	@${MKDIR} ${STAGEDIR}${PREFIX}/lib/emby-server
	(cd ${WRKSRC}/MediaBrowser.Server.Mono/bin/Release\ Mono && \
		${ECHO_MSG} "Deleting the following non-BSD library files:" && \
		${FIND} -E . -iregex '(.*\.dylib|.*libwebp.*|.*sqlite3.*|.*.dylib.*|MediaInfo\.dll)' -print -delete && \
		${FIND} . -type d -empty -print -delete && \
		${COPYTREE_SHARE} . ${STAGEDIR}${PREFIX}/lib/emby-server)

.include <bsd.port.mk>
