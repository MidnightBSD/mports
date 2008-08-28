# New ports collection Makefile for: 	jackit
# Date created:			14 May 2002
# Whom:				arved
#
# $FreeBSD: ports/audio/jack/Makefile,v 1.30 2006/07/07 14:52:52 ahze Exp $
# $MidnightBSD: mports/audio/jack/Makefile,v 1.3 2008/02/28 17:52:27 laffer1 Exp $
#

PORTNAME=	jackit
PORTVERSION=	0.103.0
CATEGORIES=	audio
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	jackit
DISTNAME=	jack-audio-connection-kit-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A low-latency audio server
LICENSE=	gpl2

LIB_DEPENDS=	portaudio.0:${PORTSDIR}/audio/portaudio \
		sndfile.1:${PORTSDIR}/audio/libsndfile \
		FLAC.7:${PORTSDIR}/audio/flac

OPTIONS=	DOCS "Build HTML documentation. Requires doxygen/TeX." off

LATEST_LINK=	jack
CONFIGURE_ENV=	LIBS="${PTHREAD_LIBS}" LDFLAGS="-L${LOCALBASE}/lib" \
		CPPFLAGS="-I${LOCALBASE}/include" \
		CFLAGS="${CFLAGS} ${PTHREAD_CFLAGS}"
GNU_CONFIGURE=	yes
USE_GETOPT_LONG=	yes
USE_LDCONFIG=	yes
USE_GNOME=	pkgconfig gnometarget gnomehack

MAN1=		jackd.1 jackstart.1

.include <bsd.port.pre.mk>

.if exists(${LOCALBASE}/bin/doxygen) && !defined(WITH_GNOKII)
DOCS_OVERRIDE=	yes
WITH_DOCS=	yes
.endif

.if defined(WITH_DOCS) || defined(PACKAGE_BUILDING)
BUILD_DEPENDS+=	doxygen:${PORTSDIR}/devel/doxygen
PLIST_SUB+=	DOCS=""
.else
CONFIGURE_ENV+=	ac_cv_prog_HAVE_DOXYGEN="false"
PLIST_SUB+=	DOCS="@comment "
.endif

.if exists(${LOCALBASE}/lib/libreadline.so.5)
LIB_DEPENDS+=	readline.5:${PORTSDIR}/devel/readline
.endif

pre-everything::
.if defined(DOCS_OVERRIDE)
	@${ECHO_MSG}
	@${ECHO_MSG} "**********************************************************"
	@${ECHO_MSG} "* Doxygen has been detected, documentation will be built *"
	@${ECHO_MSG} "**********************************************************"
	@${ECHO_MSG}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|define USE_MLOCK|undef USE_MLOCK|' \
		${WRKSRC}/configure
	@${REINPLACE_CMD} -e "s,-lpthread,${PTHREAD_LIBS},"  \
		${WRKSRC}/configure ${WRKSRC}/libjack/Makefile.in \
		${WRKSRC}/jackd/Makefile.in \
		${WRKSRC}/example-clients/Makefile.in ${WRKSRC}/jack.pc.in
	@${REINPLACE_CMD} -e "s,-lrt,," ${WRKSRC}/libjack/Makefile.in \
		${WRKSRC}/jackd/Makefile.in \
		${WRKSRC}/example-clients/Makefile.in
	@${REINPLACE_CMD} -e "s,-ldl,," ${WRKSRC}/jackd/Makefile.in \
		${WRKSRC}/example-clients/Makefile.in
	@${REINPLACE_CMD} -e 's|md5sum|md5 -q|g' \
		${WRKSRC}/jackd/Makefile.in

post-build:
	@${RM} -f ${WRKSRC}/doc/reference/html/dir__2F*

.include <bsd.port.post.mk>
