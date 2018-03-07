# Created by: Brad Lanam <bll@gentoo.com>
# $FreeBSD: head/sysutils/di/Makefile 419323 2016-07-30 15:52:46Z pawel $
# $MidnightBSD$

PORTNAME=	di
PORTVERSION=	4.44
CATEGORIES=	sysutils
MASTER_SITES=	https://gentoo.com/di/ \
		http://www.cyberbotx.com/di/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Disk Information Utility

LICENSE=	zlib
LICENSE_FILE=	${WRKSRC}/LICENSE

MAKE_ENV=	prefix="${PREFIX}"
MAKE_ARGS=	-e

post-patch:
	@${REINPLACE_CMD} -e "s|zoneid_t|zoneId_t|g" ${WRKSRC}/C/di.c

pre-install:
	@${STRIP_CMD} ${WRKSRC}/C/di

.include <bsd.port.mk>
