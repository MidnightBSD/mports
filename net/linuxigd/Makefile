# $MidnightBSD$

PORTNAME=	linuxigd
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	net
MASTER_SITES=	SF/linux-igd/linux-igd/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Linux UPnP Internet Gateway Device

LICENSE=	gpl2

LIB_DEPENDS=	libupnp.so:${PORTSDIR}/devel/upnp

USE_RC_SUBR=	linuxigd
USES=		gmake

post-extract:
	@${RM} ${WRKSRC}/iptc.?

post-patch:
	@${FIND} ${WRKSRC} -type f | ${XARGS} ${REINPLACE_CMD} -e "s|%%PREFIX%%|${PREFIX}|g"

.include <bsd.port.mk>
