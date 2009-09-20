# New ports collection makefile for:	libcompizconfig
# Date created:				2007-08-16
# Whom:					Robert Noland <rnoland@2hip.net>
#
# $MidnightBSD: mports/x11-wm/libcompizconfig/Makefile,v 1.2 2008/05/28 18:15:16 stevan Exp $
# $FreeBSD: ports/x11-wm/libcompizconfig/Makefile,v 1.5 2008/04/19 17:55:55 miwi Exp $
#

PORTNAME=	libcompizconfig
PORTVERSION=	0.6.0
#PORTREVISION=	0
CATEGORIES=	x11-wm
MASTER_SITES=	http://releases.compiz-fusion.org/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An alternative configuration system for Compiz
LICENSE=	gpl2

BUILD_DEPENDS=	${LOCALBASE}/libdata/pkgconfig/compiz.pc:${PORTSDIR}/x11-wm/compiz

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_GMAKE=	yes
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22

USE_GNOME=	gnomehack intltool libxml2

CONFIGURE_TARGET=	--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib ${PTHREAD_LIBS}"

post-patch:
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|'	\
		${WRKSRC}/src/main.c			\
		${WRKSRC}/src/lists.c			\
		${WRKSRC}/src/compiz.c			\
		${WRKSRC}/src/filewatch.c		\
		${WRKSRC}/src/ini.c			\
		${WRKSRC}/backend/ini.c

.include <bsd.port.mk>
