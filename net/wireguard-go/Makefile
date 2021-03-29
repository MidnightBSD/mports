PORTNAME=	wireguard-go
PORTVERSION=	0.0.20210323
PORTEPOCH=	1
CATEGORIES=	net
MASTER_SITES=	https://git.zx2c4.com/wireguard-go/snapshot/
DISTFILES=	${PORTNAME}-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	WireGuard implementation in Go

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gmake go:modules,no_targets tar:xz

FAKE_OPTS=	trueprefix

USE_GITHUB=	nodefault
GH_TUPLE=	golang:crypto:5ea612d1eb83:golang_crypto/vendor/golang.org/x/crypto \
		golang:net:e18ecbb05110:golang_net/vendor/golang.org/x/net \
		golang:sys:94ec62e08169:golang_sys/vendor/golang.org/x/sys

MAKE_ENV+=	${GO_ENV} GOFLAGS="${GO_BUILDFLAGS}"

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
