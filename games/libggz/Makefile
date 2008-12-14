# ex:ts=8
#
# $MidnightBSD: ports/games/libggz/Makefile,v 1.22 2008/06/06 13:31:37 edwin Exp $
#

PORTNAME=	libggz
PORTVERSION=	${GGZ_VERSION}
CATEGORIES=	games

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The GGZ Gaming Zone - Base Library
LICENSE=	gpl2

LIB_DEPENDS=	gcrypt.15:${PORTSDIR}/security/libgcrypt

USE_AUTOTOOLS=	libtool:15
USE_GNOME=	gnomehack gnometarget
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="${CPPFLAGS}" LDFLAGS="${LDFLAGS}"
CONFIGURE_ARGS=	--disable-debug
USE_LDCONFIG=	yes

MAN3=	ggz.h.3

CPPFLAGS=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS=	-L${LOCALBASE}/lib ${PTHREAD_LIBS}

.if defined(WITH_GNUTLS)
LIB_DEPENDS+=	gnutls.26:${PORTSDIR}/security/gnutls
CONFIGURE_ARGS+=	--with-tls=GnuTLS
.else
USE_OPENSSL=	yes
CONFIGURE_ARGS+=	--with-tls=OpenSSL
.endif

.include <bsd.port.pre.mk>
.include "${PORTSDIR}/games/libggz/bsd.ggz.mk"
.include <bsd.port.post.mk>
