# $MidnightBSD: mports/misc/wmweather+/Makefile,v 1.7 2012/02/05 03:44:38 laffer1 Exp $

PORTNAME=	wmweather+
PORTVERSION=	2.11
PORTREVISION=	4
CATEGORIES=	misc windowmaker geography
MASTER_SITES=	SF
MASTER_SITE_SUBDIR=wmweatherplus

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Displays current conditions and forecasts with icons and text
LICENSE=	gpl2

LIB_DEPENDS=	curl:${PORTSDIR}/ftp/curl \
		wraster:${PORTSDIR}/x11-wm/windowmaker \
		pcre.1:${PORTSDIR}/devel/pcre \
		tiff:${PORTSDIR}/graphics/tiff \
		Hermes:${PORTSDIR}/graphics/Hermes \
		png15:${PORTSDIR}/graphics/png \
		jpeg.11:${PORTSDIR}/graphics/jpeg \
		ungif:${PORTSDIR}/graphics/libungif

GNU_CONFIGURE=	yes
USE_ICONV=	yes
USE_XORG=	xpm

CONFIGURE_ARGS+=	--with-libwraster=${LOCALBASE}
MAN1=		wmweather+.1

post-patch:
	@${CP} ${WRKSRC}/wmweather+.c ${WRKSRC}/wmweather+.c.dist
	@${SED} -e "s#^void usage(int i) __THROW.*#void usage(int i);#" \
		${WRKSRC}/wmweather+.c.dist > ${WRKSRC}/wmweather+.c

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/wmweather+ ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/wmweather+.1 ${PREFIX}/man/man1
	@${MKDIR} ${EXAMPLESDIR}
	@${INSTALL_DATA} ${WRKSRC}/HINTS ${EXAMPLESDIR}/HINTS
	@${INSTALL_DATA} ${WRKSRC}/example.conf ${EXAMPLESDIR}/example.conf

.include <bsd.port.mk>
