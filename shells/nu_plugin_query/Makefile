PORTNAME=	nu_plugin_query
DISTVERSION=	0.116.1
CATEGORIES=	shells
MASTER_SITES=	https://crates.io/api/v1/crates/${PORTNAME}/${DISTVERSION}/download?dummy=/:main
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:main

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nushell plugin: Querying SQL, XML, JSON, HTML, and WebPage Metadata
WWW=		https://www.nushell.sh/

LICENSE=	mit


LIB_DEPENDS=	libcurl.so:ftp/curl

USES=		cargo ssl

PLIST_FILES=	bin/${PORTNAME}

OPENSSLINC=	/usr/include
OPENSSLLIB=	/usr/lib

.include <bsd.port.mk>
