# New ports collection makefile for:	libao
# Date created:				2006
# Whom:					Adam Karim <archite@midnightbsd.org>
#
# $MidnightBSD: mports/audio/libao/Makefile,v 1.3 2007/11/08 23:30:32 laffer1 Exp $
# $FreeBSD: ports/audio/libao/Makefile,v 1.40 2007/07/24 15:10:13 rafan Exp $
#

PORTNAME=	libao
PORTVERSION=	0.8.8
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://downloads.xiph.org/releases/ao/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable audio output library
LICENSE=	gpl2

USE_AUTOTOOLS=	libtool:15
WANT_GNOME=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
INSTALLS_SHLIB=	yes

.if defined(NOPORTDOCS)
MAKE_ENV=	DOC=""
.else
MAKE_ENV=	DOC=doc
.endif

MAN5=		libao.conf.5

OPTIONS=	ARTS "Enable the aRts module" off \
		ESOUND "Enable the EsounD module" off \
		NAS "Enable the Network Audio System module" off \
		PULSEAUDIO "Enable the PulseAudio module" off

.include <bsd.port.pre.mk>

.if defined(WITH_ARTS)
LIB_DEPENDS+=	artsc.0:${PORTSDIR}/audio/arts
.else
CONFIGURE_ARGS+=--disable-arts
.endif

.if defined(WITH_ESOUND)
USE_GNOME+=	esound
.else
CONFIGURE_ARGS+=--disable-esd
.endif

.if defined(WITH_NAS)
LIB_DEPENDS+=	audio.2:${PORTSDIR}/audio/nas
.else
CONFIGURE_ARGS+=--disable-nas
.endif

.if defined(WITH_PULSEAUDIO)
LIB_DEPENDS+=	pulse-simple.0:${PORTSDIR}/audio/pulseaudio
.else
CONFIGURE_ARGS+=--disable-pulse
.endif

.for m in ARTS ESOUND NAS PULSEAUDIO
.   if defined(WITH_$m)
PLIST_SUB+=	$m=""
.   else
PLIST_SUB+=	$m="@comment "
.   endif
.endfor

post-patch:
	@${REINPLACE_CMD} -e 's|/etc/libao.conf|${PREFIX}&|' \
		${WRKSRC}/libao.conf.5 ${WRKSRC}/src/ao_private.h \
		${WRKSRC}/doc/config.html

.include <bsd.port.post.mk>
