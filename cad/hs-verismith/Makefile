PORTNAME=	verismith
DISTVERSION=	1.1.0
PORTREVISION=	2
CATEGORIES=	cad haskell

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Verilog fuzzer
WWW=		https://hackage.haskell.org/package/verismith/ \
		https://github.com/ymherklotz/verismith/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cabal

PORTSCOUT=	limit:^.*[0-9]\.[0-9] # prevent fpga20

.include <bsd.port.mk>
