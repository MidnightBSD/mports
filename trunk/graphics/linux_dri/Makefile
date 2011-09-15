# $MidnightBSD: mports/graphics/linux_dri/Makefile,v 1.5 2011/06/19 13:56:42 laffer1 Exp $
# $FreeBSD: ports/graphics/linux_dri/Makefile,v 1.20 2006/08/08 19:19:35 bsam Exp $

PORTNAME=	linux_dri
PORTVERSION=	7.0
PORTREVISION=	2
CATEGORIES=	graphics linux
MASTER_SITES=	http://people.freebsd.org/~anholt/dri/files/
DISTFILES=	Mesa-linux-bin-${PORTVERSION}.tar.bz2 \
		linux-libglide.tar.gz \
		linux-dri-tools.tar.gz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Binary Linux DRI libraries for 3D hardware acceleration of linux apps
LICENSE=	agg

CONFLICTS=	linux_dri-6.5.2006* linux-libGLU-[0-9]* linux-f8-dri-[0-9]* \
		linux-f8-libGLU-[0-9]* linux-f10-dri-[0-9]* linux-dri-[0-9]* \
		linux-f10-libGLU-[0-9]*

WRKSRC=		${WRKDIR}
NO_BUILD=	yes
USE_LINUX=	yes
USE_LINUX_PREFIX=	yes
USE_LINUX_APPS=	xorglibs

# don't package this for amd64 until we come up with 32-bit ioctl wrappers for
# the drm.
ONLY_FOR_ARCHS=	i386 amd64

MODULELIST=	i810_dri.so \
		i915_dri.so \
		i965_dri.so \
		mach64_dri.so \
		mga_dri.so \
		r128_dri.so \
		r200_dri.so \
		r300_dri.so \
		radeon_dri.so \
		savage_dri.so \
		sis_dri.so \
		tdfx_dri.so \
		unichrome_dri.so
#LDCONFIG_LINUX=	${LINUXBASE}/sbin/ldconfig

.include <bsd.port.pre.mk>

do-install:
	${MKDIR} ${PREFIX}/usr/X11R6/lib/modules/dri
	${INSTALL_PROGRAM} ${WRKSRC}/linux_dri/libGL.so.1.2 \
		${PREFIX}/usr/X11R6/lib
#	${BRANDELF} -t Linux ${PREFIX}/usr/X11R6/lib/libGL.so.1.2
	${INSTALL_PROGRAM} ${WRKSRC}/linux_dri/libGLU.so.1.3.070100 \
		${PREFIX}/usr/X11R6/lib
	${INSTALL_PROGRAM} ${WRKSRC}/linux_dri/libdrm.so.2.3.0 \
		${PREFIX}/usr/lib
	${INSTALL_PROGRAM} ${WRKSRC}/linux_dri/libexpat.so.1 \
		${PREFIX}/usr/lib
#	${BRANDELF} -t Linux ${PREFIX}/usr/X11R6/lib/libGLU.so.1.3.070100
.for i in ${MODULELIST}
	${INSTALL_PROGRAM} ${WRKSRC}/linux_dri/${i} \
		${PREFIX}/usr/X11R6/lib/modules/dri
.endfor
#	The libglide3 distributed with linux_base is broken and is symlinked poorly, supply our own.
	${INSTALL_PROGRAM} ${WRKDIR}/linux-libglide/libglide3-v3.so.0 ${PREFIX}/usr/X11R6/lib
	${INSTALL_PROGRAM} ${WRKDIR}/linux-libglide/libglide3-v5.so.0 ${PREFIX}/usr/X11R6/lib
	${LN} -sf libglide3-v3.so.0 ${PREFIX}/usr/X11R6/lib/libglide3-v3.so
	${LN} -sf libglide3-v5.so.0 ${PREFIX}/usr/X11R6/lib/libglide3-v5.so
	${INSTALL_PROGRAM} ${WRKDIR}/linux-dri-tools/libglut.so.3.7.0 ${PREFIX}/usr/X11R6/lib
	${INSTALL_PROGRAM} ${WRKDIR}/linux-dri-tools/gears ${PREFIX}/usr/X11R6/bin
	${BRANDELF} -t Linux ${PREFIX}/usr/X11R6/bin/gears
	${INSTALL_PROGRAM} ${WRKDIR}/linux-dri-tools/glxinfo ${PREFIX}/usr/X11R6/bin
	${BRANDELF} -t Linux ${PREFIX}/usr/X11R6/bin/glxinfo

post-install:
	@${LDCONFIG_LINUX} ${PREFIX}/usr/X11R6/lib

.include <bsd.port.post.mk>
