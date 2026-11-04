PORTNAME=	nu_plugin_formats
DISTVERSION=	0.116.1
CATEGORIES=	shells
MASTER_SITES=	https://crates.io/api/v1/crates/${PORTNAME}/${DISTVERSION}/download?dummy=/:main
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:main

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nushell plugin: Support for several additional data formats
WWW=		https://www.nushell.sh/

LICENSE=	mit


USES=		cargo

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
