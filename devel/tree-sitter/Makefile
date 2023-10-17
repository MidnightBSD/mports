PORTNAME=	tree-sitter
DISTVERSIONPREFIX=	v
DISTVERSION=	0.20.8
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Incremental parser generator
WWW=		https://tree-sitter.github.io/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

USES=		gmake
USE_GITHUB=	yes

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libtree-sitter.so.*

.include <bsd.port.mk>
