

PORTNAME=	timemachine
PORTVERSION=	0.3.3
PORTREVISION=	5
CATEGORIES=	audio
MASTER_SITES=	http://plugin.org.uk/timemachine/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	JACK audio capture tool

LICENSE=	gpl2

LIB_DEPENDS=	libjack.so:audio/jack \
		liblo.so:audio/liblo \
		libsndfile.so:audio/libsndfile

OPTIONS_DEFINE=	LASH

USES=		gmake pathfix pkgconfig
USE_GNOME=	gtk20
GNU_CONFIGURE=	yes
LDFLAGS+=	-lm

LASH_LIB_DEPENDS=	liblash.so:audio/lash
LASH_CONFIGURE_OFF=	--disable-lash

post-patch:
	@${REINPLACE_CMD} -e \
		'/^PACKAGE_CFLAGS=/s|-g||; \
		 /^PACKAGE_LIBS=/s|-g||' ${WRKSRC}/configure

.include <bsd.port.mk>
