PORTNAME=	liveMedia
PORTVERSION=	2018.02.28
PORTEPOCH=	2
CATEGORIES=	net devel
MASTER_SITES=	http://www.live555.com/liveMedia/public/ \
		https://download.videolan.org/contrib/live555/
DISTNAME=	live.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LIVE.COM Streaming Media

LICENSE=	lgpl2.1

NO_CDROM=	'dated material'

BROKEN_sparc64=		Fails to compile

WRKSRC=		${WRKDIR}/live

HAS_CONFIGURE=	yes

CONFIGURE_SCRIPT=	genMakefiles
CONFIGURE_ARGS=		fixed-midnightbsd

USES=		gmake
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fPIC
.else
CFLAGS+=	-fpic
.endif

post-extract:
	${CP} ${FILESDIR}/config.fixed-midnightbsd ${WRKSRC}

.if ${PREFIX} != "/usr/local"
post-configure:
	${REINPLACE_CMD} -e 's,^PREFIX = /usr/local,PREFIX = "${PREFIX}",' \
		${WRKSRC}/Makefile ${WRKSRC}/*/Makefile
.endif

.include <bsd.port.post.mk>
