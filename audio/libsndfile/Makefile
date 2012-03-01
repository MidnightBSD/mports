# $MidnightBSD: mports/audio/libsndfile/Makefile,v 1.8 2011/12/15 00:45:49 laffer1 Exp $

PORTNAME=	libsndfile
PORTVERSION=	1.0.25
CATEGORIES=	audio
MASTER_SITES=	http://www.mega-nerd.com/libsndfile/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reading and writing files containing sampled sound (like WAV or AIFF)
LICENSE=	lgpl

USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--disable-gcc-pipe \
		--disable-sqlite \
		--disable-alsa \
		--disable-octave
CPPFLAGS+=	-isystem /usr/include -isystem ${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_LDCONFIG=	yes

MAN1=		sndfile-concat.1 sndfile-cmp.1 sndfile-convert.1 \
		sndfile-info.1 sndfile-metadata-get.1 sndfile-metadata-set.1 \
		sndfile-play.1 sndfile-deinterleave.1 sndfile-interleave.1

PORTDOCS=	AUTHORS ChangeLog NEWS README libsndfile.css \
		new_file_type.HOWTO libsndfile.jpg *.html

OPTIONS=	EXTERNAL "Enable FLAC and Ogg Vorbis support" on

.include <bsd.port.pre.mk>

.if defined(WITHOUT_EXTERNAL)
CONFIGURE_ARGS+=--disable-external-libs
.else
LIB_DEPENDS+=	FLAC.10:${PORTSDIR}/audio/flac \
		vorbis.4:${PORTSDIR}/audio/libvorbis
.endif

post-patch:
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/ doc / /g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${TAR} -C ${WRKSRC}/doc --exclude "*Makefile*" --exclude "*.in" \
		-cf - . | ${TAR} -C ${DOCSDIR} --unlink -xf -
	@${CHOWN} ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
