# $MidnightBSD$

PORTNAME=	gstreamer-plugins
PORTVERSION=	0.10.0
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	# empty
PKGNAMESUFFIX=	-mp3
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gstreamer Plugins Mp3 decoder meta-port

LICENSE=	agg

NO_BUILD=	yes
WANT_GSTREAMER=	yes

OPTIONS_MULTI=	MP3
OPTIONS_MULTI_MP3=	MAD FLUENDO
OPTIONS_DEFAULT=	MAD
FLUENDO_DESC=	Use Fluendo Mp3 decoder

PKG_PLIST+=	share/gstreamer-plugins/mp3.meta

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MMAD}
USE_GSTREAMER+=	mad
.endif

.if ${PORT_OPTIONS:MFLUENDO}
USE_GSTREAMER+=	fluendo-mp3
.endif

post-extract:
	${MKDIR} ${WRKSRC}

post-install:
	${TOUCH} ${PREFIX}/share/gstreamer-plugins/mp3.meta

.include <bsd.port.mk>
