# $MidnightBSD$

PORTNAME=	dummyflash
PORTVERSION=	1.0
PORTREVISION=	5
CATEGORIES=	www
MASTER_SITES=	ftp://ftp.netscape.com/pub/sdk/plugin/unix/
DISTNAME=	unix-sdk-3.0b5
EXTRACT_SUFX=	.tar.Z

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Silently consume flash MIME types
LICENSE=	unknown

USE_XORG=	x11
BUILD_WRKSRC=	${WRKSRC}/PluginSDK30b5/examples/UnixTemplate/Unix
NO_WRKSUBDIR=	yes
MAKEFILE=	makefile.freebsd

USE_WEBPLUGINS=	native
WEBPLUGINS_FILES=dummyflash.so

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/www/browser35/Makefile.webplugins"

do-install:
	@${MKDIR} ${WEBPLUGINS_DIR}
	${INSTALL_DATA} ${BUILD_WRKSRC}/dummyflash.so ${WEBPLUGINS_DIR}

.include <bsd.port.post.mk>
