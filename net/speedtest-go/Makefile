PORTNAME=	speedtest-go
DISTVERSIONPREFIX=	v
DISTVERSION=	1.7.8
CATEGORIES=	net www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLI and Go API to test internet speed using speedtest.net
WWW=		https://github.com/showwin/speedtest-go

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

GO_MODULE=	github.com/showwin/speedtest-go
GO_TARGET=	.:${PORTNAME}

PLIST_FILES=	bin/speedtest-go

NO_TEST=	yes

.include <bsd.port.mk>
