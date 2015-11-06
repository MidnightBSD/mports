# $MidnightBSD$

PORTNAME=	libnatpmp
PORTVERSION=	20140401
CATEGORIES=	net
MASTER_SITES=	http://miniupnp.free.fr/files/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	NAT-PMP lightweight library

LICENSE=	bsd3

USES=		gmake
USE_LDCONFIG=	yes

MAKE_ARGS+=	CC="${CC}"
MAKE_ENV+=	INSTALLPREFIX=${FAKE_DESTDIR}${TRUE_PREFIX}

PLIST_FILES=	bin/natpmpc \
		include/natpmp.h \
		lib/libnatpmp.a \
		lib/libnatpmp.so \
		lib/libnatpmp.so.1

post-patch:
	@${REINPLACE_CMD} -e 's/^LIBSPEC //' \
		-e '/declspec\.h/d' \
		${WRKSRC}/natpmp.h

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/natpmpc \
		${PREFIX}/lib/libnatpmp.so.1

.include <bsd.port.mk>
