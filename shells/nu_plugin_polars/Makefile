PORTNAME=	nu_plugin_polars
DISTVERSION=	0.116.1
CATEGORIES=	shells
MASTER_SITES=	https://crates.io/api/v1/crates/${PORTNAME}/${DISTVERSION}/download?dummy=/:main
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:main

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nushell plugin: Dataframe commands based on polars
WWW=		https://www.nushell.sh/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_armv7=	compilation fails: rustc-LLVM ERROR: out of memory
BROKEN_i386=	compilation fails: failed to resolve: use of undeclared crate or module alloc, see https://github.com/nushell/nushell/issues/13903

LIB_DEPENDS=	libzstd.so:archivers/zstd

USES=		cargo localbase

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
