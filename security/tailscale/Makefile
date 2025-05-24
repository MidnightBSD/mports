PORTNAME=	tailscale
PORTVERSION=	1.80.0
DISTVERSIONPREFIX=	v
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mesh VPN that makes it easy to connect your devices
WWW=		https://tailscale.com/

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

RUN_DEPENDS=	ca_root_nss>0:security/ca_root_nss

USES=		go:1.23,modules

GO_MODULE=	github.com/tailscale/tailscale

USE_RC_SUBR=	tailscaled

GO_TARGET=	./cmd/tailscale \
		./cmd/tailscaled
GO_BUILDFLAGS=	-tags xversion -ldflags "\
		-X tailscale.com/version.longStamp=${PORTVERSION} \
		-X tailscale.com/version.shortStamp=${PORTVERSION}"

PLIST_FILES=	bin/tailscale  \
		bin/tailscaled

NO_TEST=	yes

.include <bsd.port.mk>
