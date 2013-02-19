# New ports collection makefile for:	dummyflash
# Date Created:				June 16 2004
# Whom:					Daniel O'Connor <darius@dons.net.au>
#
# $MidnightBSD: mports/www/dummyflash/Makefile,v 1.3 2010/05/29 06:11:55 laffer1 Exp $
# $FreeBSD: ports/www/dummyflash/Makefile,v 1.5 2006/10/19 18:00:56 pav Exp $
#

PORTNAME=	dummyflash
PORTVERSION=	1.0
PORTREVISION=	4
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
