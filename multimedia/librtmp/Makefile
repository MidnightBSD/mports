# $MidnightBSD$

PORTNAME=	librtmp
PORTVERSION=	2.4.20151223
CATEGORIES=	multimedia net
MASTER_SITES=	FREEBSD_LOCAL/hrs
DISTNAME=	rtmpdump-2.4.fa8646da

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	RTMP stream library

LICENSE=	gpl2

FAKE_OPTS=	trueprefix

USES=		pkgconfig tar:bzip2
USE_LDCONFIG=	yes
USE_OPENSSL=	yes
CFLAGS+=	${PTHREAD_CFLAGS} -I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}
WRKSRC=		${WRKDIR}/${DISTNAME}/librtmp

.include <bsd.port.mk>
