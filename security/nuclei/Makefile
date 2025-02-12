PORTNAME=	nuclei
DISTVERSIONPREFIX=	v
DISTVERSION=	3.3.8
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast vulnerability scanner
WWW=		https://github.com/projectdiscovery/nuclei

LICENSE=	mit

USES=		go:1.21,modules
GO_MODULE=	github.com/projectdiscovery/nuclei/v3

GO_TARGET=	./cmd/${PORTNAME}

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
