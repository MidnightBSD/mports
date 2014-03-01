# $MidnightBSD$

PORTNAME=	libmad
PORTVERSION=	0.15.1b
PORTREVISION=	4
CATEGORIES=	audio
MASTER_SITES=	SF/mad/${PORTNAME}/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libmad library (part of MAD project)

LICENSE=	gpl2

OPTIONS_DEFINE=	SPEED
SPEED_DESC=	Optimize for speed over accuracy

CONFIGURE_ARGS=	--disable-debugging --enable-sso
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
USES=		libtool:oldver

SUB_LIST=	VERSION=${PORTVERSION}
SUB_FILES=	mad.pc

SPEED_CONFIGURE_ON=	--enable-speed
SPEED_CONFIGURE_OFF=	--enable-accuracy

post-patch:
	@${REINPLACE_CMD} -e 's| -fforce-mem||' ${WRKSRC}/configure

post-build:
	@${STRIP_CMD} ${WRKSRC}/.libs/libmad.so.2.1

post-install:
	${INSTALL_DATA} ${WRKDIR}/mad.pc ${PREFIX}/libdata/pkgconfig/
	@${CP} ${PREFIX}/lib/libmad.so.2.1 ${PREFIX}/lib/libmad.so.2
	(cd ${PREFIX}/lib && ln -sf libmad.so.2 libmad.so)

.include <bsd.port.mk>
