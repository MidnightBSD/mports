# $MidnightBSD$
# $FreeBSD: ports/audio/esound/Makefile,v 1.62 2007/02/01 02:41:17 kris Exp $

PORTNAME=	esound
PORTVERSION=	0.2.41
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sound library for enlightenment package

LICENSE=	gpl2

LIB_DEPENDS=	audiofile:${PORTSDIR}/audio/libaudiofile

USES=		tar:bzip2
USE_AUTOTOOLS=	libtool
USE_GNOME=	 gnomehack
USE_LDCONFIG=	yes
GNU_CONFIGURE=  yes
CONFIGURE_ENV=	JW=false


CONFLICTS=	py*-ro-[0-9]*

post-patch:
	@${REINPLACE_CMD} -e 's|esdconf_DATA = esd.conf|esdconf_DATA = |g' \
		${WRKSRC}/Makefile.in

post-install:
	if [ ! -f ${PREFIX}/etc/esd.conf ]; then \
		${INSTALL_DATA} ${WRKSRC}/esd.conf ${PREFIX}/etc/esd.conf; \
		${INSTALL_DATA} ${WRKSRC}/esd.conf ${PREFIX}/etc/esd.conf.default; \
	else \
		${INSTALL_DATA} ${WRKSRC}/esd.conf ${PREFIX}/etc/esd.conf.default; \
	fi

.include <bsd.port.mk>
