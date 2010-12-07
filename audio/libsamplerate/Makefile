# $FreeBSD: ports/audio/libsamplerate/Makefile,v 1.15 2006/06/09 18:00:28 ahze Exp $
# $MidnightBSD: mports/audio/libsamplerate/Makefile,v 1.5 2010/02/27 19:37:25 laffer1 Exp $

PORTNAME=	libsamplerate
PORTVERSION=	0.1.7
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://www.mega-nerd.com/SRC/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Secret Rabbit Code: a Sample Rate Converter for audio
LICENSE=	gpl2

LIB_DEPENDS=	sndfile.1:${PORTSDIR}/audio/libsndfile \
		fftw3.5:${PORTSDIR}/math/fftw3

USE_GNOME=	gnomehack pkgconfig
USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--disable-gcc-pipe  --build=${MACHINE_ARCH}-portbld-freebsd6.0 \
		--program-prefix=''
USE_LDCONFIG=	yes

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.css ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.png ${DOCSDIR}
.endif

.include <bsd.port.mk>
