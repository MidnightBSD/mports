PORTNAME=	fswatch
DISTVERSION=	1.13.0
CATEGORIES=	filesystems sysutils
MASTER_SITES=	https://github.com/emcrisostomo/${PORTNAME}/releases/download/${DISTVERSION}/
PKGNAMESUFFIX=	-mon

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Cross-platform file change monitor
WWW=		https://github.com/emcrisostomo/fswatch

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		compiler:c++11-lang libtool makeinfo
USE_LDCONFIG=	yes

CONFLICTS_INSTALL=	fswatch
GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
INFO=	fswatch
INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_USES=	gettext
NLS_CONFIGURE_ENABLE=	nls

.include <bsd.port.mk>
