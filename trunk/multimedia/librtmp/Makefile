# $MidnightBSD$

PORTNAME=	librtmp
PORTVERSION=	2.4.20130923
CATEGORIES=	multimedia net
MASTER_SITES=	FREEBSD_LOCAL/hrs
DISTNAME=	rtmpdump-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RTMP stream library

LICENSE=	gpl2

FAKE_OPTS=	trueprefix

USES=		pkgconfig
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
CFLAGS+=	${PTHREAD_CFLAGS} -I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
WRKSRC=		${WRKDIR}/${DISTNAME}/librtmp

.include <bsd.port.mk>
