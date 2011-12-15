# ex:ts=8
#
# $MidnightBSD: mports/games/ggz-client-libs/Makefile,v 1.3 2011/02/02 21:01:20 laffer1 Exp $
#

PORTNAME=	ggz-client-libs
PORTVERSION=	${GGZ_VERSION}
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GGZ Gaming Zone - Core Client Libraries
LICENSE=	gpl2

LIB_DEPENDS=	expat.6:${PORTSDIR}/textproc/expat2

USE_AUTOTOOLS=	libtool
USE_GNOME=	
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--disable-debug --with-libggz-dir="${LOCALBASE}"
USE_LDCONFIG=	yes
USE_GGZ=	core

MAN1=	ggzwrap.1
MAN3=	ggzcore_h.3 ggzmod_h.3
MAN5=	ggz.modules.5
MAN6=	ggz.6 ggz-config.6 ggz-wrapper.6
MAN7=	ggz.7

CPPFLAGS=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.if defined(WITHOUT_NLS)
CONFIGURE_ARGS+=	--disable-nls
PLIST_SUB+=	NLS="@comment "
.else
USE_GETTEXT=	yes
PLIST_SUB+=	NLS=""
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|libggz.la|libggz.so|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|#!/bin/bash|#!/bin/sh|' ${WRKSRC}/ggz-wrapper/ggz

post-install:
	@${TOUCH} ${PREFIX}/etc/ggz.modules

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/games/libggz/bsd.ggz.mk"
.include <bsd.port.post.mk>
