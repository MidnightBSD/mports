# ex:ts=8
#
# $MidnightBSD$
#

PORTNAME=	ggz-client-libs
PORTVERSION=	${GGZ_VERSION}
PORTREVISION=	1
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GGZ Gaming Zone - Core Client Libraries

LICENSE=	gpl2

LIB_DEPENDS=	libexpat.so:${PORTSDIR}/textproc/expat2

USES=		gettext libtool
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--disable-debug --with-libggz-dir="${LOCALBASE}"
USE_LDCONFIG=	yes
USE_GGZ=	core

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
