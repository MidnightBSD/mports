# $FreeBSD: ports/x11-servers/mga_hal/Makefile,v 1.4 2006/11/19 12:58:03 pav Exp $
# $MidnightBSD$

PORTNAME=	mga_hal
PORTVERSION=	4.4.0
PORTREVISION=	2
CATEGORIES=	x11-servers
MASTER_SITES=	ftp://ftp.matrox.com/pub/mga/archive/linux/%SUBDIR%/:i386,amd64
MASTER_SITE_SUBDIR=	2006/:i386 2006/64bit/:amd64
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}:${ARCH}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module for additional features with X.Org/XFree86 Matrox driver

LICENSE=	matrox
LICENSE_NAME=	Matrox binary license
LICENSE_TEXT=	Matrox drivers may not be distributed.
LICENSE_PERMS=	no-dist-sell no-dist-mirror no-pkg-sell

RESTRICTED=	Matrox drivers may not be distributed.



OPTIONS_DEFINE=	DOCS

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
DISTNAME=	matrox_driver-x86_32-${PORTVERSION}
.elif ${ARCH} == "amd64"
DISTNAME=	matrox_driver-x86_64-${PORTVERSION}
.endif

WRKSRC=		${WRKDIR}/${DISTNAME}
NO_BUILD=	YES
XORG_VERSION=	6.9.0

do-install:
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/docs/readme.txt ${DOCSDIR}
	${MKDIR} ${PREFIX}/lib/modules/drivers
	${INSTALL_DATA} ${WRKSRC}/xserver/${XORG_VERSION}/mga_hal_drv.so \
		${PREFIX}/lib/modules/drivers/
	${INSTALL_DATA} ${WRKSRC}/xserver/${XORG_VERSION}/mga_drv.so \
		${PREFIX}/lib/modules/drivers/

.include <bsd.port.post.mk>
