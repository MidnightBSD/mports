# $MidnightBSD: mports/audio/libsndfile/Makefile,v 1.5 2009/02/22 16:53:47 laffer1 Exp $

PORTNAME=	libsndfile
PORTVERSION=	1.0.17
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	http://www.mega-nerd.com/libsndfile/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Reading and writing files containing sampled sound (like WAV or AIFF)
LICENSE=	gpl2

USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-justsrc --disable-gcc-pipe --disable-sqlite
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
USE_LDCONFIG=	yes

MAN1=		sndfile-convert.1 sndfile-info.1 sndfile-play.1

OPTIONS=	FLAC "Enable flac support" On

.include <bsd.port.pre.mk>

.if !defined(WITHOUT_FLAC)
LIB_DEPENDS+=	FLAC.10:${PORTSDIR}/audio/flac
CONFIGURE_ARGS+=--enable-flac
.else
CONFIGURE_ARGS+=--disable-flac
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|@mandir@|${PREFIX}/man|' ${WRKSRC}/man/Makefile.in
	@${REINPLACE_CMD} -e '/^SUBDIRS =/s/ doc / /g' ${WRKSRC}/Makefile.in

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
.for file in AUTHORS ChangeLog NEWS README TODO
	${INSTALL_DATA} ${WRKSRC}/${file} ${DOCSDIR}
.endfor
	${TAR} -C ${WRKSRC}/doc --exclude "*Makefile*" --exclude "*.in" \
		-cf - . | ${TAR} -C ${DOCSDIR} --unlink -xf -
	@${CHOWN} ${SHAREOWN}:${SHAREGRP} ${DOCSDIR}
.endif

.include <bsd.port.post.mk>
