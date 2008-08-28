# New ports collection makefile for:	theora
# Date created:				09 februari 2003
# Whom:					Koop Mast <kwm@rainbow-runner.nl>
#
# $MidnightBSD: mports/multimedia/libtheora/Makefile,v 1.4 2007/11/24 00:33:46 laffer1 Exp $
# $FreeBSD: ports/multimedia/libtheora/Makefile,v 1.12 2006/06/29 19:27:59 stefan Exp $
#

PORTNAME=	libtheora
DISTVERSION=	1.0beta2
CATEGORIES=	multimedia
MASTER_SITES=	http://downloads.xiph.org/releases/theora/ \
		http://distfiles.master.finkmirrors.net/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Theora video codec for the Ogg multimedia streaming system
LICENSE=	bsd3

LIB_DEPENDS=	vorbis.4:${PORTSDIR}/audio/libvorbis

USE_BZIP2=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool:15
USE_GNOME=	ltverhack
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include " \
		LDFLAGS="-L${LOCALBASE}/lib" \
		LIBS="${PTHEAD_LIBS}"
CONFIGURE_ARGS+=	--disable-sdltest \
		--enable-shared \
		--disable-examples

post-patch:
	@${REINPLACE_CMD} -e 's|doc||g' ${WRKSRC}/Makefile.in

.include <bsd.port.mk>
