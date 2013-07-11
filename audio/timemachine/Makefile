# $MidnightBSD: mports/audio/timemachine/Makefile,v 1.1 2010/02/27 19:39:16 laffer1 Exp $

PORTNAME=	timemachine
PORTVERSION=	0.3.3
CATEGORIES=	audio
MASTER_SITES=	http://plugin.org.uk/timemachine/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JACK audio capture tool
LICENSE=	gpl2

LIB_DEPENDS=	jack.0:${PORTSDIR}/audio/jack \
		lo.7:${PORTSDIR}/audio/liblo \
		sndfile.1:${PORTSDIR}/audio/libsndfile

OPTIONS_DEFINE=	LASH

USES=        pathfix
USE_GNOME=	gtk20
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MLASH}
LIB_DEPENDS+=	lash.2:${PORTSDIR}/audio/lash
.else
CONFIGURE_ARGS+=--disable-lash
.endif

post-patch:
	@${REINPLACE_CMD} -e \
		'/^PACKAGE_CFLAGS=/s|-g||; \
		 /^PACKAGE_LIBS=/s|-g||' ${WRKSRC}/configure

.include <bsd.port.mk>
