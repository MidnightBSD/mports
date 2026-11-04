PORTNAME=	nu_plugin_gstat
DISTVERSION=	0.116.1
CATEGORIES=	shells
MASTER_SITES=	https://crates.io/api/v1/crates/${PORTNAME}/${DISTVERSION}/download?dummy=/:main
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:main

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nushell plugin: Information on the status of a Git repository
WWW=		https://www.nushell.sh/

LICENSE=	mit


LIB_DEPENDS=	libssh2.so:security/libssh2

USES=		cargo localbase ssl

OPENSSLINC=	/usr/include
OPENSSLLIB=	/usr/lib

PLIST_FILES=	bin/${PORTNAME}

.include <bsd.port.mk>
