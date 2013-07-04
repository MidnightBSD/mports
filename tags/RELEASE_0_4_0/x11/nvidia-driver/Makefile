# $MidnightBSD: mports/x11/nvidia-driver/Makefile,v 1.13 2013/03/20 01:02:57 laffer1 Exp $

PORTNAME=	nvidia-driver
DISTVERSION?=	310.44
PORTREVISION?=	1
CATEGORIES=	x11 kld
MASTER_SITES=	${MASTER_SITE_NVIDIA}
ARCH_SUFX=	${ARCH:S/i386//:S/amd/_/}
# MASTER_SITE_SUBDIR has to be set later because it depends on NVVERSION
DISTNAME=	NVIDIA-FreeBSD-x86${ARCH_SUFX}-${DISTVERSION}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	NVidia graphics card binary drivers for hardware OpenGL rendering
LICENSE=	nvidia

USE_XORG=	xorg-server
USE_GL=		gl
USE_LDCONFIG=	yes
MAKE_ENV=	NVIDIA_ROOT=${WRKSRC} X11BASE=${LOCALBASE}
SUB_FILES=	pkg-deinstall pkg-install pkg-message
DOCSDIR=	${PREFIX}/share/doc/NVIDIA_GLX-1.0
MODULESDIR=	lib/xorg/modules
PORTDOCS=	*

FAKE_OPTS+=	trueprefix

# Starting with version 1.0-7667, NVidia has dropped support for numerous
# "legacy" GPUs.  Consult NVidia README (the Appendix) to find out whether
# you need to use legacy driver version and install one of corresponding
# `x11/nvidia-driver-71', `x11/nvidia-driver-96', or `x11/nvidia-driver-173'
# slave ports.
#
# XXX Until NVidia starts to name their releases consistently, employ this
# ugly hack below to derive NVVERSION. XXX
#
.if ${DISTVERSION:C/[0-9]+//g} == ".."			# major.minor.update
NVVERSION=	${DISTVERSION:S/.//g}
.else							# major.minor
NVVERSION=	${DISTVERSION:S/.//g}00
.endif

.if ${NVVERSION} >= 1952200
MASTER_SITE_SUBDIR=	XFree86/FreeBSD-x86${ARCH_SUFX}/${DISTVERSION}
ONLY_FOR_ARCHS=	i386 amd64
.else
MASTER_SITE_SUBDIR=	freebsd/${DISTVERSION}
ONLY_FOR_ARCHS=	i386
.endif

OPTIONS=	FREEBSD_AGP	"Use FreeBSD AGP GART driver" off \
		ACPI_PM		"Enable support for ACPI Power Management" off \
		LINUX		"Build with support for Linux compatibility" on
.if ${NVVERSION} >= 1952200
OPTIONS+=	WBINVD		"Enable heavy-weight cache-flush logic" off
.endif

.if ${NVVERSION} <= 1904200
EXTRA_PATCHES=	${FILESDIR}/legacy-patch-nvidia.lib.mk
.endif

# Fix recent arbitrary memory access vulnerability in legacy drivers
.if ${NVVERSION} <= 1905300
. if ${NVVERSION} != 1731435
EXTRA_PATCHES+=	${FILESDIR}/security-patch-CVE-2012-0946
. endif
EXTRA_PATCHES+=	${FILESDIR}/security-patch-CVE-2012-4225
.endif

.include <bsd.port.pre.mk>

PLIST_SUB+=	LINUXBASE=${LINUXBASE} SHLIB_VERSION=${PORTVERSION} \
		MODULESDIR=${MODULESDIR}

.if !defined(WITHOUT_LINUX)
CONFLICTS=	linux-dri-[0-9]* linux-f10-dri-[0-9]* linux-f8-dri-[0-9]* \
		linux_dri-[0-9]* linux_dri-devel-[0-9]*
USE_LINUX=	yes
PLIST_SUB+=	LINUX=""
.else
PLIST_SUB+=	LINUX="@comment "
# Propagate WITHOUT_LINUX variable down to inner Makefiles
MAKE_ENV+=	WITHOUT_LINUX=yes
.endif

.if ${OSVERSION} < 4001 && ${NVVERSION} >= 1952200
IGNORE=		requires fairly recent CURRENT
.endif

.if ${NVVERSION} < 1952200
LIB_DEPENDS+=	m.3:${PORTSDIR}/misc/compat5x
.endif

post-patch: .SILENT
	${MKDIR} ${FAKE_DESTDIR}/boot/kernel
	${MKDIR} ${FAKE_DESTDIR}/boot/modules
	${MKDIR} ${FAKE_DESTDIR}${TRUE_PREFIX}/${MODULESDIR}/extensions
# We should support -CURRENT: kill the check
	${REINPLACE_CMD} -e '24,26d' ${WRKSRC}/src/nv-freebsd.h
# Adjust legacy drivers for updated d_mmap() since early 9.X
.if ${OSVERSION} > 4015 && ${NVVERSION} < 1952200
	${REINPLACE_CMD} -e 's/vm_offset_t offset/vm_ooffset_t offset/ ; \
		s/vm_offset_t \*address/vm_paddr_t *address/ ; \
		s/int nprot/&, vm_memattr_t *memattr/' \
			${WRKSRC}/src/nvidia_dev.c
.endif
# Catch up legacy drivers with FreeBSD src SVN r225617
.if ${OSVERSION} > 4015 && ${NVVERSION} < 1952200
	${REINPLACE_CMD} -e '/return/s/ioctl/sys_&/' \
		${WRKSRC}/src/nvidia_linux.c
.endif
# Process OPTIONS
.if defined(WITH_FREEBSD_AGP)
	${REINPLACE_CMD} -E 's/undef (NV_SUPPORT_OS_AGP)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if defined(WITH_ACPI_PM)
	${REINPLACE_CMD} -E 's/undef (NV_SUPPORT_ACPI_PM)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if defined(WITHOUT_LINUX)
	${REINPLACE_CMD} -E 's/define (NV_SUPPORT_LINUX_COMPAT)/undef \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
.if defined(WITH_WBINVD)
	${REINPLACE_CMD} -E 's/undef (NV_USE_WBINVD)/define \1/' \
		${WRKSRC}/src/nv-freebsd.h
.endif
	${REINPLACE_CMD} -e '/exists/s/$$/ \&\& !defined(WITHOUT_LINUX)/' \
		${WRKSRC}/lib/Makefile
# Do not install VDPAU libraries which are provided by `multimedia/libvdpau'
# port for a while now
.if ${NVVERSION} >= 1802900
	${REINPLACE_CMD} -e '/libvdpau[[:blank:]_][^n]/d ; \
		s/name libvdpau/&_nvidia/' ${WRKSRC}/lib/Makefile
.endif
# Do not build any binaries (native nvidia-settings and nvidia-xconfig are
# provided by corresponding ports) and manual pages
.if ${NVVERSION} < 974600 || ${NVVERSION} >= 1952200
	${REINPLACE_CMD} -E 's/(extension).*/\1/' ${WRKSRC}/x11/Makefile
.else
	${REINPLACE_CMD} -E 's/(lib).*/\1/' ${WRKSRC}/x11/Makefile
.endif
	${REINPLACE_CMD} -e '/bin/d ; /man/d' ${WRKSRC}/x11/Makefile
# Conditionally install documentation (but you generally want it)
.if defined(NOPORTDOCS)
	${REINPLACE_CMD} -E 's/(x11).*/\1/ ; /doc/d' ${WRKSRC}/Makefile
.endif
# Adjust installation paths of some conflicting files (shared also between
# libGL and xorg-server) to ease package manager work
	${REINPLACE_CMD} -e '/LIBDIR/s:xorg/modules/extensions:&/.nvidia:' \
		${WRKSRC}/x11/extension/Makefile
	${REINPLACE_CMD} -e '/LIBDIR/s:lib:&/.nvidia:' \
		${WRKSRC}/lib/libGL/Makefile
# Do not execute afterinstall target (prevent automatic module registration
# and "smart" installation of conflicting files heuristics)
	${REINPLACE_CMD} -e 's/afterinstall/dontexecute/' ${WRKSRC}/Makefile
	${REINPLACE_CMD} -e 's/beforeinstall/dontexecute/' \
		${WRKSRC}/lib/Makefile ${WRKSRC}/src/Makefile

pre-install:
# While this port silently assumes PREFIX == LOCALBASE, at least try to
# pretend we support different paths thereof and make sure these directories
# exist
	@cd ${PREFIX}/${MODULESDIR} && ${MKDIR} drivers extensions

post-install: .SILENT
# pkg-plist is already overbloated, so use these hacks instead of PLIST_SUB's
.if ${NVVERSION} < 817400
	${REINPLACE_CMD} -e '/libnvidia-cfg/d' ${TMPPLIST}
.endif
.if ${NVVERSION} < 974600 || ${NVVERSION} >= 1952200
	${REINPLACE_CMD} -e '/wfb/d' ${TMPPLIST}
.endif
.if ${NVVERSION} < 1802900
	${REINPLACE_CMD} -e '/vdpau/d' ${TMPPLIST}
.endif
.if ${NVVERSION} < 1851829
	${REINPLACE_CMD} -e '/libcuda/d' ${TMPPLIST}
.endif
.if ${NVVERSION} >= 2565300
	${REINPLACE_CMD} -E 's/libGLcore/libnvidia-glcore/ ; \
		/usr.*(glcore|tls).*so\.1$$/d' ${TMPPLIST}
.endif
.if ${NVVERSION} >= 3101900
	${REINPLACE_CMD} -e '/libXvMCNVIDIA/d' ${TMPPLIST}
.else # some applications need this symlink
	${LN} -sf libXvMCNVIDIA.so.1 ${PREFIX}/lib/libXvMCNVIDIA_dynamic.so.1
.endif
.if ${NVVERSION} >= 1952200
. if ${OSVERSION} > 4014
	${REINPLACE_CMD} -e '/does not support PAE/,+1d' ${PKGMESSAGE}
. else	# when sed(1) does not support "addr1,+N" ranges, use line numbers
	${REINPLACE_CMD} -e '26,27d' ${PKGMESSAGE}
. endif
.endif

.include <bsd.port.post.mk>
