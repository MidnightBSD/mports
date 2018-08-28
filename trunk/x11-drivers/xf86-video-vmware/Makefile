# $MidnightBSD$
# $FreeBSD: head/x11-drivers/xf86-video-vmware/Makefile 473914 2018-07-04 18:30:10Z zeising $

PORTNAME=	xf86-video-vmware
PORTVERSION=	13.3.0
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org vmware display driver

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

ONLY_FOR_ARCHS=	amd64 i386
ONLY_FOR_ARCHS_REASON=	The vmware gfx protocol is only supported on x86-compatible architectures.

XORG_CAT=	driver

.include <bsd.mport.options.mk>

.if ${ARCH} == i386
USE_GCC=	any
.endif

.include <bsd.port.mk>
