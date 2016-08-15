# $MidnightBSD$
# $FreeBSD: head/ftp/waiho/Makefile 383626 2015-04-09 07:44:41Z bapt $

PORTNAME=	waiho
PORTVERSION=	0.2
CATEGORIES=	ftp gnustep
MASTER_SITES=	http://www.roard.com/waiho/download/
DISTNAME=	Waiho-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple FTP client for GNUstep

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		tar:tgz gnustep
USE_GNUSTEP=	back build

post-install:
	${STRIP_CMD} ${PREFIX}/GNUstep/Local/Applications/Waiho.app/Waiho

.include <bsd.port.mk>
