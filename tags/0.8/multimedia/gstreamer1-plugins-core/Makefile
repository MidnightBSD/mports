# Created by: Michael Johnson <ahze@FreeBSD.org>
# $MidnightBSD$

PORTNAME=	gstreamer1-plugins-core
PORTVERSION=	${GST1_VERSION}${GST1_MINIMAL_VERSION}
PORTREVISION=	0
CATEGORIES=	multimedia audio
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Core set of typical audio and video gstreamer-plugins

LICENSE=	gpl2

NO_BUILD=	yes
GST_DIR=	lib/gstreamer-1.0
PLIST_FILES=	${GST_DIR}/.gstreamer-plugins-core.keep

USE_GSTREAMER1=yes

OPTIONS_DEFINE=	DVD
OPTIONS_DEFAULT=DVD
DVD_DESC=	Include DVD related plugins

.include <bsd.mport.options.mk>

# Audio plugins
USE_GSTREAMER1+=	mad ogg vorbis

# Graphics plugins
USE_GSTREAMER1+=	png

# Misc plugins
USE_GSTREAMER1+=	pango

# Multimedia plugins
USE_GSTREAMER1+=	libav good theora

.if ${PORT_OPTIONS:MDVD}
# dvd related plugins plugins
USE_GSTREAMER1+=	a52dec dvdread resindvd dts
.endif

do-install:
	${MKDIR} ${PREFIX}/${GST_DIR}
	${TOUCH} -f ${PREFIX}/${GST_DIR}/.gstreamer-plugins-core.keep

.include <bsd.port.mk>
