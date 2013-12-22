# $MidnightBSD$

PORTNAME=	xf86-video-newport
PORTVERSION=	0.2.4
CATEGORIES=	x11-drivers

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X.Org newport display driver

LICENSE=	mit

XORG_CAT=	driver
USE_XORG=	videoproto
MAN4=		newport.4x

post-patch:
		${REINPLACE_CMD} -e 's|values.h|sys/limits.h|' \
				 -e 's|MAXSHORT|SHRT_MAX|g' \
				 ${WRKSRC}/src/newport_accel.c

.include <bsd.port.mk>
