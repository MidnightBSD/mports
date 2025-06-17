PORTNAME=	youtube
DISTVERSIONPREFIX=	v
DISTVERSION=	2.10.4
CATEGORIES=	www
PKGNAMESUFFIX=	-downloader

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Youtube videos downloader
WWW=		https://github.com/kkdai/youtube

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:1.23,modules

GO_MODULE=	github.com/kkdai/youtube/v2
GO_TARGET=	./cmd/youtubedr

PLIST_FILES=	${GO_TARGET:C/.\/cmd/bin/}

.include <bsd.port.mk>
