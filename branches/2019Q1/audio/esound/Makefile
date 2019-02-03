# $MidnightBSD$
# $FreeBSD: ports/audio/esound/Makefile,v 1.62 2007/02/01 02:41:17 kris Exp $

PORTNAME=	esound
PORTVERSION=	0.2.41
PORTREVISION=	3
CATEGORIES=	audio
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound library for enlightenment package

LICENSE=	gpl2

LIB_DEPENDS=	libaudiofile.so:audio/libaudiofile

USES=		libtool:keepla pathfix pkgconfig:both tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=  yes
CONFIGURE_ENV=	JW=false
#CONFIGURE_TARGET=       ${ARCH}-portbld-freebsd10.4
#CONFIGURE_ARGS+=	--host=${ARCH}-portbld-freebsd10.4
INSTALL_TARGET=	install-strip

CONFLICTS=	py*-ro-[0-9]*

post-patch:
	@${REINPLACE_CMD} -e 's|esdconf_DATA = esd.conf|esdconf_DATA = |g' \
		-e '/^esd_LDADD =/s/$$/ -lm/' \
		${WRKSRC}/Makefile.in

post-install:
	${INSTALL_DATA} ${WRKSRC}/esd.conf ${STAGEDIR}${PREFIX}/etc/esd.conf.sample

.include <bsd.port.mk>
