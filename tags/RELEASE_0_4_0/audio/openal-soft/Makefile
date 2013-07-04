# $MidnightBSD$
# $FreeBSD: ports/audio/openal-soft/Makefile,v 1.13 2011/04/03 07:33:37 mva Exp $

PORTNAME=	openal-soft
PORTVERSION=	1.13
CATEGORIES=	audio
MASTER_SITES=	http://kcat.strangesoft.net/openal-releases/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A software implementation of the OpenAL specification
LICENSE=	lgpl

CONFLICTS=	openal-200[0-9]*

USE_BZIP2=	yes
USE_CMAKE=	yes
USE_LDCONFIG=	yes
CMAKE_USE_PTHREAD=	yes
CMAKE_ARGS+=	-DALSA:BOOL=OFF -DPORTAUDIO:BOOL=OFF -DSOLARIS:BOOL=OFF \
		-DDSOUND:BOOL=OFF -DALSOFT_CONFIG:BOOL=ON

OPTIONS=	PULSEAUDIO	"Enable sound streaming using PulseAudio" off

.include <bsd.port.pre.mk>

.if defined(WITH_PULSEAUDIO)
LIB_DEPENDS+=	pulse-simple.0:${PORTSDIR}/audio/pulseaudio
CFLAGS+=	-Iinclude -I${LOCALBASE}/include
CONFIGURE_ENV+=	LDFLAGS="-L${LOCALBASE}/lib"
CMAKE_ARGS+=	-DPULSEAUDIO:BOOL=ON
.else
CMAKE_ARGS+=	-DPULSEAUDIO:BOOL=OFF
.endif

post-patch:
	@${REINPLACE_CMD} 's|/etc/openal|${ETCDIR}|' \
		${WRKSRC}/Alc/alcConfig.c \
		${WRKSRC}/CMakeLists.txt
	@${REINPLACE_CMD} 's|alsoft.conf|alsoft.conf.sample|' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.post.mk>
