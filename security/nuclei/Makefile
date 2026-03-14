PORTNAME=	nuclei
DISTVERSIONPREFIX=	v
DISTVERSION=	3.7.0
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast vulnerability scanner
WWW=		https://github.com/projectdiscovery/nuclei

LICENSE=	mit

USES=		go:1.24,modules
GO_MODULE=	github.com/projectdiscovery/nuclei/v3

GO_TARGET=	./cmd/${PORTNAME}

PLIST_FILES=	bin/${PORTNAME}

NO_TEST=	yes

.include <bsd.port.mk>
