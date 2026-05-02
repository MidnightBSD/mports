PORTNAME=	goplaces
DISTVERSIONPREFIX=	v
DISTVERSION=	0.3.0
CATEGORIES=	misc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modern Google Places CLI in Go
WWW=		https://github.com/steipete/goplaces

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:1.25+,modules

GO_MODULE=	github.com/steipete/goplaces
GO_TARGET=	./cmd/goplaces

PLIST_FILES=	bin/goplaces

.include <bsd.port.mk>
