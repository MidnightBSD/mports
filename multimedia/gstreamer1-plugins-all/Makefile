PORTNAME=	gstreamer1-plugins-all
PORTVERSION=	1.20
PORTREVISION=	0
CATEGORIES=	multimedia
DISTFILES=      # none
EXTRACT_ONLY=   # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Meta-port of all gstreamer 1.x plugins
WWW=		https://gstreamer.freedesktop.org/

LICENSE=	agg

USES=		gstreamer metaport

NO_BUILD=       yes
NO_MTREE=       yes

.include <bsd.mport.options.mk>

# Weed out gst-plugins that can not be packaged. or are broken.
.if defined(MAGUS)
# FAAC:    Mp4 Dolby license , no package
# LAME:    MP3 License , no package
# VDPAU:   Needs to be build agains running kernel
USE_GSTREAMER=	${_GST_PLUGINS_VER:Nfaac:Nlame:Nvdpau}
.else
USE_GSTREAMER=	${_GST_PLUGINS_VER}
.endif

do-install: build
	@${DO_NADA}

.include <bsd.port.mk>
