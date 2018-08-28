# $MidnightBSD$

PORTNAME=	xorg-drivers
PORTVERSION=	7.7
PORTREVISION=	1
CATEGORIES=	x11-drivers
MASTER_SITES=	# none
DISTFILES=	# none
EXTRACT_ONLY=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.org drivers meta-port
LICENSE=	agg

.MAKE.FreeBSD_UL=	yes

VIDEODIR=	${PREFIX}/lib/xorg/modules/drivers
INPUTDIR=	${PREFIX}/lib/xorg/modules/input

NO_BUILD=	yes

INPUT_DRIVERS=		mouse \
			keyboard \
			acecad \
			elographics \
			hyperpen \
			joystick \
			magictouch \
			mutouch \
			penmount \
			synaptics \
			vmmouse \
			void

VIDEO_DRIVERS=		ati \
			mach64 \
			nv \
			r128 \
			vesa \
			apm \
			ark \
			chips \
			cyrix \
			dummy \
			fbdev \
			glint \
			i128 \
			i740 \
			mga \
			neomagic \
			rendition \
			s3 \
			s3virge \
			savage \
			siliconmotion \
			sis \
			tdfx \
			trident \
			tseng \
			vmware \
			voodoo

OPTIONS_DEFAULT=	MOUSE \
			KEYBOARD \
			ATI \
			MACH64 \
			NV \
			R128 \
			VESA

.for type in input video
. for a in ${${type:U}_DRIVERS}
OPTIONS_DEFINE+=	${a:U}
${a:U}_DESC=	Install ${a} ${type} driver
. endfor
.endfor

OPTIONS_DEFINE_i386=	INTEL OPENCHROME
OPTIONS_DEFAULT_i386=	INTEL OPENCHROME

OPTIONS_DEFINE_amd64:=	${OPTIONS_DEFINE_i386}
OPTIONS_DEFAULT_amd64:=	${OPTIONS_DEFAULT_i386}

INTEL_DESC=		Install intel video driver
OPENCHROME_DESC=	Install openchrome video driver

# these drivers have a different module name compared to the plugin they install
QUIRKS=		keyboard:kbd

.include <bsd.mport.options.mk>

VIDEO_DRIVERS+=	intel openchrome

.for type in input video
. for i in ${${type:U}_DRIVERS}
.  if ${PORT_OPTIONS:M${i:U}} != ""
.   if ${QUIRKS:M${i}\:*:C/.*://} != ""
RUN_DEPENDS+=	${${type:U}DIR}/${QUIRKS:M${i}\:*:C/.*://}_drv.so:${PORTSDIR}/x11-drivers/xf86-${type}-${i}
.   else
RUN_DEPENDS+=	${${type:U}DIR}/${i}_drv.so:${PORTSDIR}/x11-drivers/xf86-${type}-${i}
.   endif
.  endif
. endfor
.endfor

do-install:
		${MKDIR} ${PREFIX}/libdata/xorg
		${TOUCH} ${PREFIX}/libdata/xorg/drivers

.include <bsd.port.mk>
