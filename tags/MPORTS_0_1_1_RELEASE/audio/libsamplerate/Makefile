# New ports collection makefile for:	libsamplerate
# Date created:				2 February 2003
# Whom:			<dmagda+libsamplerate@ee.ryerson.ca>
#
# $FreeBSD: ports/audio/libsamplerate/Makefile,v 1.15 2006/06/09 18:00:28 ahze Exp $
# $MidnightBSD$
#

PORTNAME=	libsamplerate
PORTVERSION=	0.1.2
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	http://www.mega-nerd.com/SRC/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Secret Rabbit Code: a Sample Rate Converter for audio

LIB_DEPENDS=	sndfile.1:${PORTSDIR}/audio/libsndfile \
		fftw3.4:${PORTSDIR}/math/fftw3

USE_GNOME=	gnomehack gnometarget pkgconfig
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"
CONFIGURE_ARGS=	--disable-gcc-pipe  --build=${MACHINE_ARCH}-portbld-freebsd6.0
INSTALLS_SHLIB=	yes

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.css ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.png ${DOCSDIR}
.endif

.include <bsd.port.mk>
