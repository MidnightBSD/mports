PORTNAME=	nvidia-libs
DISTVERSION?=	${NVIDIA_DISTVERSION}
# Always try to set PORTREVISION as it can be overridden by the slave ports
PORTREVISION?=	0
CATEGORIES=	x11 linux
MASTER_SITES=	NVIDIA/XFree86/Linux-${ARCH_SUFX}/${DISTVERSION}/
DISTNAME=	NVIDIA-Linux-${ARCH_SUFX}-${DISTVERSION}
EXTRACT_SUFX=	.run
PKGNAMEPREFIX=	linux-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NVidia graphics libraries and programs (Linux version)
WWW=		https://www.nvidia.com/object/unix.html

LICENSE_FILE=	${WRKSRC}/LICENSE
.include "${.CURDIR}/../nvidia-driver/Makefile.version"
.include "${.CURDIR}/../nvidia-driver/Makefile.common"

# Choose proper distinfo file using PKGNAMESUFFIX for slave ports.
# Kept for switching to centralized distinfo with suffixes.
.ifdef PKGNAMESUFFIX
DISTINFO_FILE=	${.CURDIR}/distinfo
.endif

.if ${DISTVERSION:R} > 390
PORTSCOUT=	limit:\.\d+$$		# ignore *-no-compat32 distfiles
.else
PORTSCOUT=	limit:^${DISTVERSION:R}\.\d+$$
.endif

USES=		linux
USE_LINUX=	xorglibs
USE_LDCONFIG=	yes
NO_BUILD=	yes

PLIST_RE=	# empty

LINUX_LIBDIR=	/usr/lib${ARCH:S/i386//:S/amd//}

LINUX_LIBS+=	libcuda.so.${PORTVERSION} \
		libnvcuvid.so.${PORTVERSION} \
		libnvidia-cfg.so.${PORTVERSION} \
		libnvidia-compiler.so.${PORTVERSION} \
		libnvidia-glcore.so.${PORTVERSION} \
		libnvidia-ml.so.${PORTVERSION} \
		libnvidia-opencl.so.${PORTVERSION} \
		libnvidia-tls.so.${PORTVERSION} \
		libvdpau_nvidia.so.${PORTVERSION}
LINUX_LINKS+=	libcuda.so.${PORTVERSION} libcuda.so.1 \
		libcuda.so.${PORTVERSION} libcuda.so \
		libnvcuvid.so.${PORTVERSION} libnvcuvid.so.1 \
		libnvcuvid.so.${PORTVERSION} libnvcuvid.so \
		libnvidia-cfg.so.${PORTVERSION} libnvidia-cfg.so.1 \
		libnvidia-cfg.so.${PORTVERSION} libnvidia-cfg.so \
		libnvidia-ml.so.${PORTVERSION} libnvidia-ml.so.1 \
		libnvidia-ml.so.${PORTVERSION} libnvidia-ml.so \
		libnvidia-opencl.so.${PORTVERSION} libnvidia-opencl.so.1 \
		libvdpau_nvidia.so.${PORTVERSION} vdpau/libvdpau_nvidia.so.1
LINUX32_LIBS+=	libcuda.so.${PORTVERSION} \
		libnvidia-compiler.so.${PORTVERSION} \
		libnvidia-glcore.so.${PORTVERSION} \
		libnvidia-ml.so.${PORTVERSION} \
		libnvidia-opencl.so.${PORTVERSION} \
		libnvidia-tls.so.${PORTVERSION} \
		libvdpau_nvidia.so.${PORTVERSION}
.if ${NVVERSION} < 415.013
LINUX_LIBS+=	tls/libnvidia-tls.so.${PORTVERSION}
LINUX32_LIBS+=	tls/libnvidia-tls.so.${PORTVERSION}
.endif
LINUX32_LINKS=	libcuda.so.${PORTVERSION} libcuda.so.1 \
		libcuda.so.${PORTVERSION} libcuda.so \
		libnvidia-ml.so.${PORTVERSION} libnvidia-ml.so.1 \
		libnvidia-ml.so.${PORTVERSION} libnvidia-ml.so \
		libnvidia-opencl.so.${PORTVERSION} libnvidia-opencl.so.1 \
		libvdpau_nvidia.so.${PORTVERSION} vdpau/libvdpau_nvidia.so.1
LINUX_PROGS=	nvidia-debugdump nvidia-settings nvidia-smi nvidia-xconfig
LINUX_MANS=	nvidia-settings nvidia-smi nvidia-xconfig
LINUX_DATA=	nvidia.icd /etc/OpenCL/vendors
.if ${NVVERSION} >= 375.010
LINUX_DATA+=	10_nvidia.json /usr/share/glvnd/egl_vendor.d
.else
PLIST_RE+=	'\,${LINUXBASE}/usr/share/glvnd,d'
.endif
.if ${NVVERSION} >= 378.009
LINUX_DATA+=	10_nvidia_wayland.json /usr/share/egl/egl_external_platform.d
.else
PLIST_RE+=	'\,${LINUXBASE}/usr/share/egl,d'
.endif
.if ${NVVERSION} >= 361.016
LINUX_LIBS+=	libEGL_nvidia.so.${PORTVERSION}
LINUX_LINKS+=	libEGL_nvidia.so.${PORTVERSION} libEGL_nvidia.so.0
LINUX32_LIBS+=	libEGL_nvidia.so.${PORTVERSION}
LINUX32_LINKS+=	libEGL_nvidia.so.${PORTVERSION} libEGL_nvidia.so.0
.elif ${NVVERSION} >= 355.006
LINUX_LIBS+=	libEGL_nvidia.so.0
PLIST_RE+=	'\,${LINUXBASE}.*libEGL_nvidia\.so\.${PORTVERSION},d'
.else
PLIST_RE+=	'\,${LINUXBASE}.*libEGL_nvidia\.so,d'
.endif
.if ${NVVERSION} >= 361.016 && ${NVVERSION} < 450.051
LINUX_LIBS+=	libnvidia-fatbinaryloader.so.${PORTVERSION}
LINUX32_LIBS+=	libnvidia-fatbinaryloader.so.${PORTVERSION}
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-fatbinaryloader\.so,d'
.endif
.if ${NVVERSION} >= 361.016
LINUX_LIBS+=	libGLESv1_CM_nvidia.so.${PORTVERSION} \
		libGLESv2_nvidia.so.${PORTVERSION} \
		libGLX_nvidia.so.${PORTVERSION} \
		libnvidia-ptxjitcompiler.so.${PORTVERSION}
LINUX_LINKS+=	libGLESv1_CM_nvidia.so.${PORTVERSION} libGLESv1_CM_nvidia.so.1 \
		libGLESv2_nvidia.so.${PORTVERSION} libGLESv2_nvidia.so.2 \
		libGLX_nvidia.so.${PORTVERSION} libGLX_nvidia.so.0 \
		libGLX_nvidia.so.${PORTVERSION} libGLX_indirect.so.0 \
		libnvidia-ptxjitcompiler.so.${PORTVERSION} libnvidia-ptxjitcompiler.so.1 \
		libnvidia-ptxjitcompiler.so.${PORTVERSION} libnvidia-ptxjitcompiler.so
LINUX32_LIBS+=	libGLESv1_CM_nvidia.so.${PORTVERSION} \
		libGLESv2_nvidia.so.${PORTVERSION} \
		libGLX_nvidia.so.${PORTVERSION} \
		libnvidia-ptxjitcompiler.so.${PORTVERSION}
LINUX32_LINKS+=	libGLESv1_CM_nvidia.so.${PORTVERSION} libGLESv1_CM_nvidia.so.1 \
		libGLESv2_nvidia.so.${PORTVERSION} libGLESv2_nvidia.so.2 \
		libGLX_nvidia.so.${PORTVERSION} libGLX_nvidia.so.0 \
		libGLX_nvidia.so.${PORTVERSION} libGLX_indirect.so.0 \
		libnvidia-ptxjitcompiler.so.${PORTVERSION} libnvidia-ptxjitcompiler.so.1 \
		libnvidia-ptxjitcompiler.so.${PORTVERSION} libnvidia-ptxjitcompiler.so
.else
PLIST_RE+=	'\,${LINUXBASE}.*libGLESv(1_CM|2)_nvidia\.so,d' \
		'\,${LINUXBASE}.*libGLX_(nvidia|indirect)\.so,d' \
		'\,${LINUXBASE}.*libnvidia-ptxjitcompiler\.so,d'
.endif
.if ${NVVERSION} >= 495.02905 # 495.29.05
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.1.9
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.1.9 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.1.9/'
.elif ${NVVERSION} >= 470.04201 # 470.42.01
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.1.7
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.1.7 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.1.7/'
.elif ${NVVERSION} >= 460.02704 # 460.27.04
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.1.5
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.1.5 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.1.5/'
.elif ${NVVERSION} >= 440.026
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.1.4
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.1.4 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.1.4/'
.elif ${NVVERSION} >= 435.017
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.1.3
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.1.3 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.1.3/'
.elif ${NVVERSION} >= 418.030
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.1.2
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.1.2 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.1.2/'
.elif ${NVVERSION} >= 410.057
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.1.0
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.1.0 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.1.0/'
.elif ${NVVERSION} >= 396.018
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.0.3
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.0.3 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.0.3/'
.elif ${NVVERSION} >= 387.012
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.0.2
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.0.2 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.0.2/'
.elif ${NVVERSION} >= 378.013
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.0.1
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.0.1 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.0.1/'
.elif ${NVVERSION} >= 378.009
LINUX_LIBS+=	libnvidia-egl-wayland.so.1.0.0
LINUX_LINKS+=	libnvidia-egl-wayland.so.1.0.0 libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.1.0.0/'
.elif ${NVVERSION} >= 364.012
LINUX_LIBS+=	libnvidia-egl-wayland.so.${PORTVERSION}
LINUX_LINKS+=	libnvidia-egl-wayland.so.${PORTVERSION} libnvidia-egl-wayland.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libnvidia-egl-wayland\.so)\.X/\1.${PORTVERSION}/'
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-egl-wayland\.so,d'
.endif
.if ${NVVERSION} >= 331.013 && ${NVVERSION} < 495.02905
LINUX_LIBS+=	libnvidia-ifr.so.${PORTVERSION}
LINUX_LINKS+=	libnvidia-ifr.so.${PORTVERSION} libnvidia-ifr.so.1 \
		libnvidia-ifr.so.${PORTVERSION} libnvidia-ifr.so
LINUX32_LIBS+=	libnvidia-ifr.so.${PORTVERSION}
LINUX32_LINKS+=	libnvidia-ifr.so.${PORTVERSION} libnvidia-ifr.so.1 \
		libnvidia-ifr.so.${PORTVERSION} libnvidia-ifr.so
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-ifr,d'
.endif
.if ${NVVERSION} >= 331.013
LINUX_LIBS+=	libnvidia-eglcore.so.${PORTVERSION} \
		libnvidia-fbc.so.${PORTVERSION} \
		libnvidia-glsi.so.${PORTVERSION}
LINUX_LINKS+=	libnvidia-fbc.so.${PORTVERSION} libnvidia-fbc.so.1 \
		libnvidia-fbc.so.${PORTVERSION} libnvidia-fbc.so
LINUX32_LIBS+=	libnvidia-eglcore.so.${PORTVERSION} \
		libnvidia-fbc.so.${PORTVERSION} \
		libnvidia-glsi.so.${PORTVERSION}
LINUX32_LINKS+=	libnvidia-fbc.so.${PORTVERSION} libnvidia-fbc.so.1 \
		libnvidia-fbc.so.${PORTVERSION} libnvidia-fbc.so
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-(eglcore|fbc|glsi),d'
.endif
.if ${NVVERSION} >= 310.014
LINUX_LIBS+=	libnvidia-encode.so.${PORTVERSION}
LINUX_LINKS+=	libnvidia-encode.so.${PORTVERSION} libnvidia-encode.so.1 \
		libnvidia-encode.so.${PORTVERSION} libnvidia-encode.so
LINUX32_LIBS+=	libnvidia-encode.so.${PORTVERSION}
LINUX32_LINKS+=	libnvidia-encode.so.${PORTVERSION} libnvidia-encode.so.1 \
		libnvidia-encode.so.${PORTVERSION} libnvidia-encode.so
PLIST_RE+=	'\,${LINUXBASE}.*libXvMCNVIDIA,d'
.else
LINUX_LIBS+=	libXvMCNVIDIA.so.${PORTVERSION}
LINUX_LINKS+=	libXvMCNVIDIA.so.${PORTVERSION} libXvMCNVIDIA_dynamic.so.1 \
		libXvMCNVIDIA.so.${PORTVERSION} libXvMCNVIDIA_dynamic.so
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-encode,d'
.endif
.if ${NVVERSION} >= 346.016
LINUX_LIBS+=	libnvidia-gtk2.so.${PORTVERSION} \
		libnvidia-gtk3.so.${PORTVERSION}
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-gtk(2|3)\.so,d'
.endif
.if ${NVVERSION} >= 331.049 && ${NVVERSION} < 352.009
LINUX_DATA+=	monitoring.conf /usr/share/nvidia \
		${WRKSRC}/pci.ids /usr/share/nvidia
.else
PLIST_RE+=	'\,${LINUXBASE}.*monitoring\.conf,d' \
		'\,${LINUXBASE}.*pci\.ids,d'
.endif
.if ${NVVERSION} >= 334.016
LINUX_DATA+=	nvidia-application-profiles-${PORTVERSION}-key-documentation /usr/share/nvidia
.else
PLIST_RE+=	'\,${LINUXBASE}.*application-profiles-${PORTVERSION}-key-documentation,d'
.endif
.if ${NVVERSION} >= 319.012
LINUX_DATA+=	nvidia-application-profiles-${PORTVERSION}-rc /usr/share/nvidia
.else
PLIST_RE+=	'\,${LINUXBASE}.*share/nvidia,d'
.endif
.if ${NVVERSION} >= 319.017
LINUX_PROGS+=	nvidia-cuda-mps-control nvidia-cuda-mps-server \
		nvidia-persistenced
LINUX_MANS+=	nvidia-cuda-mps-control nvidia-persistenced
.else
LINUX_PROGS+=	nvidia-cuda-proxy-control nvidia-cuda-proxy-server
LINUX_MANS+=	nvidia-cuda-proxy-control
PLIST_RE+=	'\,${LINUXBASE},s/cuda-mps/cuda-proxy/' \
		'\,${LINUXBASE}.*nvidia-persistenced,d'
.endif
.if ${NVVERSION} >= 364.012
LINUX_DATA+=	nvidia_icd.json /etc/vulkan/icd.d
.else
PLIST_RE+=	'\,${LINUXBASE}/etc/vulkan,d'
.endif
.if ${NVVERSION} >= 410.057 && ${NVVERSION} < 495.02905
LINUX_LIBS+=	libnvidia-cbl.so.${PORTVERSION}
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-cbl\.so,d'
.endif
.if ${NVVERSION} >= 410.057
LINUX_LIBS+=	libnvidia-rtcore.so.${PORTVERSION}
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-rtcore\.so,d'
.endif
.if ${NVVERSION} >= 396.018
LINUX_LIBS+=	libnvidia-glvkspirv.so.${PORTVERSION}
LINUX32_LIBS+=	libnvidia-glvkspirv.so.${PORTVERSION}
.else
PLIST_RE+=	'\,${LINUXBASE}.*libnvidia-glvkspirv\.so,d'
.endif

PLIST_SUB+=	LINUXBASE=${LINUXBASE} \
		LINUX_LIBDIR=${LINUX_LIBDIR} \
		SHLIB_VERSION=${PORTVERSION}

.include <bsd.mport.options.mk>

.if ${NVVERSION} >= 390.042 && ${LINUX_DEFAULT} != c6
USE_LINUX+=	libglvnd
PLIST_RE+=	'\,${LINUXBASE}.*libEGL\.so,d' \
		'\,${LINUXBASE}.*libGL\.so,d' \
		'\,${LINUXBASE}.*libGLESv(1_CM|2)\.so,d' \
		'\,${LINUXBASE}.*libGLX\.so,d' \
		'\,${LINUXBASE}.*libGLdispatch\.so,d' \
		'\,${LINUXBASE}.*libOpenGL\.so,d'
.else
.if ${NVVERSION} >= 390.042
LINUX_LIBS+=	libEGL.so.1.1.0
LINUX_LINKS+=	libEGL.so.1.1.0 libEGL.so.1
LINUX32_LIBS+=	libEGL.so.1.1.0
LINUX32_LINKS+=	libEGL.so.1.1.0 libEGL.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libEGL\.so)\.X/\1.1.1.0/'
.elif ${NVVERSION} >= 355.006
LINUX_LIBS+=	libEGL.so.1
LINUX32_LIBS+=	libEGL.so.1
PLIST_RE+=	'\,${LINUXBASE}.*libEGL\.so\.X,d'
.elif ${NVVERSION} >= 331.013
LINUX_LIBS+=	libEGL.so.${PORTVERSION}
LINUX_LINKS+=	libEGL.so.${PORTVERSION} libEGL.so.1
LINUX32_LIBS+=	libEGL.so.${PORTVERSION}
LINUX32_LINKS+=	libEGL.so.${PORTVERSION} libEGL.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libEGL\.so)\.X/\1.${PORTVERSION}/'
.else
PLIST_RE+=	'\,${LINUXBASE}.*libEGL\.so,d'
.endif
.if ${NVVERSION} >= 390.042
LINUX_LIBS+=	libGL.so.1.7.0
LINUX_LINKS+=	libGL.so.1.7.0 libGL.so.1
LINUX32_LIBS+=	libGL.so.1.7.0
LINUX32_LINKS+=	libGL.so.1.7.0 libGL.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libGL\.so)\.X/\1.1.7.0/'
.elif ${NVVERSION} >= 361.028
LINUX_LIBS+=	libGL.so.1.0.0
LINUX_LINKS+=	libGL.so.1.0.0 libGL.so.1
LINUX32_LIBS+=	libGL.so.1.0.0
LINUX32_LINKS+=	libGL.so.1.0.0 libGL.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libGL\.so)\.X/\1.1.0.0/'
.elif ${NVVERSION} >= 361.016
LINUX_LIBS+=	libGL.so.1
LINUX32_LIBS+=	libGL.so.1
PLIST_RE+=	'\,${LINUXBASE}.*libGL\.so\.X,d'
.else
LINUX_LIBS+=	libGL.so.${PORTVERSION}
LINUX_LINKS+=	libGL.so.${PORTVERSION} libGL.so.1
LINUX32_LIBS+=	libGL.so.${PORTVERSION}
LINUX32_LINKS+=	libGL.so.${PORTVERSION} libGL.so.1
PLIST_RE+=	'\,${LINUXBASE},s/(libGL\.so)\.X/\1.${PORTVERSION}/'
.endif
.if ${NVVERSION} >= 390.042
LINUX_LIBS+=	libGLESv1_CM.so.1.2.0 \
		libGLESv2.so.2.1.0
LINUX_LINKS+=	libGLESv1_CM.so.1.2.0 libGLESv1_CM.so.1 \
		libGLESv2.so.2.1.0 libGLESv2.so.2
LINUX32_LIBS+=	libGLESv1_CM.so.1.2.0 \
		libGLESv2.so.2.1.0
LINUX32_LINKS+=	libGLESv1_CM.so.1.2.0 libGLESv1_CM.so.1 \
		libGLESv2.so.2.1.0 libGLESv2.so.2
PLIST_RE+=	'\,${LINUXBASE},s/(libGLESv1_CM\.so)\.X/\1.1.2.0/' \
		'\,${LINUXBASE},s/(libGLESv2\.so)\.X/\1.2.1.0/'
.elif ${NVVERSION} >= 361.016
LINUX_LIBS+=	libGLESv1_CM.so.1 \
		libGLESv2.so.2
LINUX32_LIBS+=	libGLESv1_CM.so.1 \
		libGLESv2.so.2
PLIST_RE+=	'\,${LINUXBASE}.*GLESv(1_CM|2)\.so\.X,d'
.elif ${NVVERSION} >= 331.013
LINUX_LIBS+=	libGLESv1_CM.so.${PORTVERSION} \
		libGLESv2.so.${PORTVERSION}
LINUX_LINKS+=	libGLESv1_CM.so.${PORTVERSION} libGLESv1_CM.so.1 \
		libGLESv2.so.${PORTVERSION} libGLESv2.so.2
LINUX32_LIBS+=	libGLESv1_CM.so.${PORTVERSION} \
		libGLESv2.so.${PORTVERSION}
LINUX32_LINKS+=	libGLESv1_CM.so.${PORTVERSION} libGLESv1_CM.so.1 \
		libGLESv2.so.${PORTVERSION} libGLESv2.so.2
PLIST_RE+=	'\,${LINUXBASE},s/(libGLESv(1_CM|2)\.so)\.X/\1.${PORTVERSION}/'
.else
PLIST_RE+=	'\,${LINUXBASE}.*libGLESv(1_CM|2)\.so,d'
.endif
.if ${NVVERSION} >= 361.016
LINUX_LIBS+=	libGLX.so.0
LINUX32_LIBS+=	libGLX.so.0
.else
PLIST_RE+=	'\,${LINUXBASE}.*libGLX\.so,d'
.endif
.if ${NVVERSION} >= 355.006
LINUX_LIBS+=	libGLdispatch.so.0 \
		libOpenGL.so.0
LINUX32_LIBS+=	libGLdispatch.so.0 \
		libOpenGL.so.0
.else
PLIST_RE+=	'\,${LINUXBASE}.*libGLdispatch\.so,d' \
		'\,${LINUXBASE}.*libOpenGL\.so,d'
.endif
.endif	# ${NVVERSION} >= 390.042 && ${LINUX_DEFAULT} != c6

.if ${ARCH} == amd64
.if ${NVVERSION} >= 310.014
LINUX32_LIBS+=	libnvcuvid.so.${PORTVERSION}
LINUX32_LINKS+=	libnvcuvid.so.${PORTVERSION} libnvcuvid.so.1 \
		libnvcuvid.so.${PORTVERSION} libnvcuvid.so
.else
PLIST_RE+=	'\,${LINUXBASE}/usr/lib/libnvcuvid\.so,d'
.endif
.endif

.if ${ARCH} == amd64
PLIST_SUB+=	LINUX32=""
.else
PLIST_SUB+=	LINUX32="@comment "
.endif

.include <bsd.port.pre.mk>

do-extract:
	@(cd ${WRKDIR} && ${SH} \
		${DISTDIR}/NVIDIA-Linux-${ARCH_SUFX}-${DISTVERSION}.run \
		--extract-only > /dev/null)

post-patch:
.if ${NVVERSION} >= 384.047 && ${NVVERSION} < 435.017
	@${SED} 's/__NV_VK_ICD__/libGLX_nvidia.so.0/' \
		${WRKSRC}/nvidia_icd.json.template > \
		${WRKSRC}/nvidia_icd.json
.endif

do-install:
# pkg-plist is already overbloated, so use these hacks instead of PLIST_SUB's
.if ${NVVERSION} >= 304.128 && ${NVVERSION} < 310.019 || ${NVVERSION} >= 361.016
	${REINPLACE_CMD} -E '\,${LINUXBASE},!{/libvdpau(_trace)?\.so/d;}' \
		${TMPPLIST}
.endif
.if ${NVVERSION} >= 310.019
	${REINPLACE_CMD} -e '\,${LINUXBASE},!{/libXvMCNVIDIA/d;}' ${TMPPLIST}
.endif
.if ${NVVERSION} < 331.013 || ${ARCH} == amd64 && ${NVVERSION} < 334.016
	${REINPLACE_CMD} -E '\,${LINUXBASE},!{/lib(nvidia-)?(EGL|eglcore|GLESv|glsi)/d;}' \
		${TMPPLIST}
.endif
.if ${NVVERSION} < 352.009
	${REINPLACE_CMD} -E '\,${LINUXBASE},!{/(lib)?nvidia-(debugdump|smi|ml)/d;}' \
		${TMPPLIST}
.endif
.if ${NVVERSION} < 355.006
	${REINPLACE_CMD} -E '\,${LINUXBASE},!{/(libEGL_nvidia|GLdispatch|OpenGL)/d;}' \
		${TMPPLIST}
.else
	${REINPLACE_CMD} '\,${LINUXBASE},!s/libEGL\.so\.${PORTVERSION}/libEGL.so/' \
		${TMPPLIST}
.endif
.if ${NVVERSION} >= 361.028
	${REINPLACE_CMD} -E '\,${LINUXBASE},!{/(EGL_nvidia\.so|GLESv[12](_CM)?(\.so\.[0-9]+\.[0-9]+))$$/d;}' \
		${TMPPLIST}
.else
	${REINPLACE_CMD} -E '\,${LINUXBASE},!{/\/lib\/libGLESv[12](_CM)?(\.so)?(_nvidia.so(\.[0-9]|\.[0-9]+\.[0-9]+)?)?$$/d ; \
		/libEGL_nvidia\.so\.${PORTVERSION}/d;}' ${TMPPLIST}
.endif
.if ${NVVERSION} >= 415.013
	${REINPLACE_CMD} -e '/tls\/libnvidia-tls\.so/d' ${TMPPLIST}
.endif
	${REINPLACE_CMD} -E ${PLIST_RE:S/^/-e /} ${TMPPLIST}
.for f d in ${LINUX_DATA}
	${MKDIR} ${LINUXBASE}${d}
	${INSTALL_DATA} ${WRKSRC}/${f} ${LINUXBASE}${d}
.endfor
	${MKDIR} ${LINUXBASE}/usr/bin
	${INSTALL_SCRIPT} ${WRKSRC}/nvidia-bug-report.sh \
		${LINUXBASE}/usr/bin
.for p in ${LINUX_PROGS}
	${INSTALL_PROGRAM} ${WRKSRC}/${p} ${LINUXBASE}/usr/bin
.endfor
	${MKDIR} ${LINUXBASE}/usr/share/man/man1
.for m in ${LINUX_MANS}
	${INSTALL_MAN} ${WRKSRC}/${m}.1.gz \
		${LINUXBASE}/usr/share/man/man1
.endfor
	${MKDIR} ${LINUXBASE}${LINUX_LIBDIR}/tls
	${MKDIR} ${LINUXBASE}${LINUX_LIBDIR}/vdpau
.for l in ${LINUX_LIBS}
	${INSTALL_LIB} ${WRKSRC}/${l} \
		${LINUXBASE}${LINUX_LIBDIR}/${l}
.endfor
.for s t in ${LINUX_LINKS}
	${RLN} ${LINUXBASE}${LINUX_LIBDIR}/${s} \
		${LINUXBASE}${LINUX_LIBDIR}/${t}
.endfor
.if ${ARCH} == amd64
	${MKDIR} ${LINUXBASE}/usr/lib/tls
	${MKDIR} ${LINUXBASE}/usr/lib/vdpau
.for l in ${LINUX32_LIBS}
	${INSTALL_LIB} ${WRKSRC}/32/${l} \
		${LINUXBASE}/usr/lib/${l}
.endfor
.for s t in ${LINUX32_LINKS}
	${RLN} ${LINUXBASE}/usr/lib/${s} \
		${LINUXBASE}/usr/lib/${t}
.endfor
.endif

.include <bsd.port.post.mk>
