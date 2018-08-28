# $MidnightBSD$

PORTNAME=	gstreamer1-plugins-all
PORTVERSION=	${GST1_VERSION}
PORTREVISION=	0
CATEGORIES=	multimedia
DISTFILES=      # none
EXTRACT_ONLY=   # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-port of all gstreamer 1.x plugins with options

LICENSE=	agg

USE_GSTREAMER1=	yes

NO_BUILD=       yes
NO_MTREE=       yes

.for all in ${_GSTREAMER_PLUGINS}
OPTIONS_DEFINE+=	${all:tu}
${all:tu}_DESC=	${all} plugin
OPTIONS_DEFAULT+=	${all:tu}
.endfor

.include <bsd.mport.options.mk>

# Weed out gst-plugins that can not be packaged. or are broken.
.if defined(PACKAGE_BUILDING)
PORT_OPTIONS:=	${PORT_OPTIONS:NFAAC} # Mp4 Dolby license , no package
PORT_OPTIONS:=	${PORT_OPTIONS:NLAME} # MP3 License , no package
PORT_OPTIONS:=	${PORT_OPTIONS:NVDPAU} # Needs to be build agains running kernel
.endif

OPTIONS_DEFINE_i386=	SPC

.for f in ${OPTIONS_DEFINE}
.if ${PORT_OPTIONS:M${f:tu}}
USE_GSTREAMER1+=${f:tl}
.endif
.endfor

do-install: build
	@${DO_NADA}

.include <bsd.port.mk>
