PORTNAME=	hledger-ui
DISTVERSION=	1.52.4
CATEGORIES=	finance haskell

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UI for hledger, the accounting software package
WWW=		https://hledger.org/ \
		https://hackage.haskell.org/package/hledger-ui

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libinotify.so:devel/libinotify

ONLY_FOR_ARCHS=		aarch64 amd64
ONLY_FOR_ARCHS_REASON=	requires the Cabal toolchain, which is only available on aarch64 and amd64

USES=		cabal

.include <bsd.port.mk>
