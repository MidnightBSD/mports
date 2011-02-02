# $MidnightBSD: mports/audio/akode-plugins-xiph/Makefile,v 1.8 2010/11/06 14:02:42 laffer1 Exp $

PORTNAME=	akode-plugins-${PORTNAMESUFX}
PORTVERSION=    2.0.2
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	audio kde
MASTER_SITES=	${MASTER_SITE_GENTOO}
MASTER_SITE_SUBDIR=distfiles
DISTNAME=	30375-akode-${PORTVERSION}.tar.bz2
EXTRACT_SUFX=   # none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	FLAC/Speex/Vorbis decoder plugin for akode
LICENSE=	gpl2

LIB_DEPENDS=	FLAC:${PORTSDIR}/audio/flac \
		ogg:${PORTSDIR}/audio/libogg \
		speex:${PORTSDIR}/audio/speex \
		vorbis:${PORTSDIR}/audio/libvorbis

CONFLICTS=	kdemultimedia-3.[1-3]*

PLUGIN=		xiph_decoder
PORTNAMESUFX=	${PLUGIN:S/_sink//:S/_decoder//:S/src_//}

USE_AUTOTOOLS=  libltdl libtool
USE_BZIP2=	yes
USE_GMAKE=	yes
WRKSRC=		${WRKDIR}/akode-${PORTVERSION}
USE_LDCONFIG=	yes

CONFIGURE_ENV+=	LDFLAGS=-L${WRKSRC}/akode/lib/.libs
CONFIGURE_ARGS+=--with-extra-libs=${LOCALBASE}/lib \
		--with-extra-includes=${LOCALBASE}/include

post-patch:
	@${SETENV} TZ=UTC \
	${TOUCH} -t 200607222217.01 ${WRKSRC}/akode/lib/akode_export.h.in

pre-configure:
	@${REINPLACE_CMD} -e 's@%%SUBDIRS%%@${PLUGIN}@g' ${WRKSRC}/akode/plugins/Makefile.in

do-build:
	cd ${WRKSRC}/akode && ${GMAKE}

do-install:
	cd ${WRKSRC}/akode/plugins/${PLUGIN} && ${GMAKE} ${FAKE_MAKEARGS} install

.include <bsd.port.mk>
