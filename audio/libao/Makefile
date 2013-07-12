# New ports collection makefile for:	libao
# Date created:				2006
# Whom:					Adam Karim <archite@midnightbsd.org>
#
# $MidnightBSD: mports/audio/libao/Makefile,v 1.8 2011/02/02 20:03:22 laffer1 Exp $

PORTNAME=	libao
PORTVERSION=	1.1.0
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/ao/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable audio output library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool
WANT_GNOME=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

MAN5=		libao.conf.5

OPTIONS_DEFINE=	DOCS ARTS ESOUND NAS PULSEAUDIO

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MDOCS}
MAKE_ENV=	DOC=doc
.else
MAKE_ENV=	DOC=""
.endif

.if ${PORT_OPTIONS:MARTS}
LIB_DEPENDS+=	artsc.0:${PORTSDIR}/audio/arts
PLIST_SUB+=	ARTS=""
.else
CONFIGURE_ARGS+=--disable-arts
PLIST_SUB+=	ARTS="@comment "
.endif

.if ${PORT_OPTIONS:MESOUND}
USE_GNOME+=	esound
PLIST_SUB+=	ESOUND=""
.else
CONFIGURE_ARGS+=--disable-esd
PLIST_SUB+=	ESOUND="@comment "
.endif

.if ${PORT_OPTIONS:MNAS}
LIB_DEPENDS+=	audio.2:${PORTSDIR}/audio/nas
PLIST_SUB+=	NAS=""
.else
CONFIGURE_ARGS+=--disable-nas
PLIST_SUB+=	NAS="@comment "
.endif

.if ${PORT_OPTIONS:MPULSEAUDIO}
LIB_DEPENDS+=	pulse-simple.0:${PORTSDIR}/audio/pulseaudio
PLIST_SUB+=	PULSEAUDIO=""
.else
CONFIGURE_ARGS+=--disable-pulse
PLIST_SUB+=	PULSEAUDIO="@comment "
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/libao.conf|${PREFIX}&|' \
		${WRKSRC}/libao.conf.5 ${WRKSRC}/include/ao/ao_private.h \
		${WRKSRC}/doc/config.html

.include <bsd.port.mk>
