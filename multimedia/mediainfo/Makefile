PORTNAME=	mediainfo
PORTVERSION=	25.04
CATEGORIES=	multimedia
MASTER_SITES=	https://mediaarea.net/download/binary/mediainfo/${PORTVERSION}/ \
		FREEBSD_LOCAL/sunpoet
DISTNAME=	MediaInfo_CLI_${PORTVERSION}_GNU_FromSource

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Provides technical and tag information for video and audio files
WWW=		https://mediaarea.net/en/MediaInfo \
		https://github.com/MediaArea/MediaInfo

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/../../../License.html

LIB_DEPENDS=	libmediainfo.so:multimedia/libmediainfo \
		libzen.so:multimedia/libzen

USES=		compiler:c++11-lang cpe libtool pathfix pkgconfig tar:xz

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/mediainfo
WRKSRC=		${WRKDIR}/MediaInfo_CLI_GNU_FromSource/MediaInfo/Project/GNU/CLI

CPE_VENDOR=	mediaarea

.include <bsd.port.mk>
