# $MidnightBSD: mports/net/linuxigd/Makefile,v 1.1 2011/06/19 19:11:53 laffer1 Exp $

PORTNAME=	linuxigd
PORTVERSION=	1.0
PORTREVISION=	1
CATEGORIES=	net
MASTER_SITES=	SF/linux-igd/linux-igd/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux UPnP Internet Gateway Device

LICENSE=	gpl2

LIB_DEPENDS=	upnp.9:${PORTSDIR}/devel/upnp

USE_RC_SUBR=	linuxigd
USE_GMAKE=	yes
MAKE_ENV=	PTHREAD_LIBS=${PTHREAD_LIBS}

MAN8=		upnpd.8

post-extract:
	@${RM} ${WRKSRC}/iptc.?

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g"

.include <bsd.port.mk>
