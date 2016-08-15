# New ports collection makefile for:	libao
# Date created:				2006
# Whom:					Adam Karim <archite@midnightbsd.org>
#
# $MidnightBSD$

PORTNAME=	libao
PORTVERSION=	1.2.0
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/ao/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable audio output library

LICENSE=	gpl2

USES=		pathfix pkgconfig libtool
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static \
		--disable-arts
# do not install
MAKE_ARGS=	ckport_DATA=""

OPTIONS_DEFINE=	DOCS ESOUND NAS PULSEAUDIO
OPTIONS_SUB=	yes

NAS_LIB_DEPENDS=libaudio.so:${PORTSDIR}/audio/nas
NAS_CONFIGURE_ENABLE=	nas

PULSEAUDIO_LIB_DEPENDS=	libpulse-simple.so:${PORTSDIR}/audio/pulseaudio
PULSEAUDIO_CONFIGURE_ENABLE=	pulse

ESOUND_CONFIGURE_ENABLE=esd
ESOUND_USE=	GNOME=esound

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/libao.conf|${PREFIX}&|' \
		${WRKSRC}/libao.conf.5 ${WRKSRC}/include/ao/ao_private.h \
		${WRKSRC}/doc/config.html

.include <bsd.port.mk>
