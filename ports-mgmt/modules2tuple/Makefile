PORTNAME=	modules2tuple
DISTVERSIONPREFIX=	v
DISTVERSION=	2.2.4
PORTREVISION=	11
CATEGORIES=	ports-mgmt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Generate GH_TUPLE from modules.txt
WWW=		https://github.com/dmgk/modules2tuple

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		go:modules

GO_MODULE=	github.com/dmgk/modules2tuple/v2
GO_BUILDFLAGS=	-ldflags="-s -w -X main.version=${PORTVERSION}"

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
