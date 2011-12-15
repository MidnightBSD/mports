# $MidnightBSD: mports/audio/libsndfile/Makefile,v 1.7 2010/02/27 19:56:13 laffer1 Exp $

PORTNAME=	libsndfile
PORTVERSION=	1.0.20
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://www.mega-nerd.com/libsndfile/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reading and writing files containing sampled sound (like WAV or AIFF)
LICENSE=	gpl2

USE_GNOME=	gnomehack  pkgconfig
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--disable-gcc-pipe \
		--disable-sqlite \
		--disable-octave
CONFIGURE_ENV=	CPPFLAGS="-isystem /usr/include -isystem ${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_LDCONFIG=	yes

MAN1=		sndfile-convert.1 sndfile-info.1 sndfile-play.1

OPTIONS=	EXTERNAL "Enable FLAC and Ogg Vorbis support" on

.include <bsd.port.pre.mk>

.if defined(WITHOUT_EXTERNAL) || defined(WITH_FLAC)
CONFIGURE_ARGS+=--disable-external-libs
.else
CONFIGURE_ARGS+=--disable-flac
LIB_DEPENDS+=	FLAC.10:${PORTSDIR}/audio/flac \
		vorbis.4:${PORTSDIR}/audio/libvorbis
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/ doc / /g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog NEWS README
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	${TAR} -C ${WRKSRC}/doc --exclude "*Makefile*" --exclude "*.in" \
		-cf - . | ${TAR} -C ${DOCSDIR} --unlink -xf -
	@${CHOWN} ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
