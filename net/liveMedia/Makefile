PORTNAME=	liveMedia
DISTVERSION=	2022.06.16
PORTEPOCH=	2
CATEGORIES=	net devel
MASTER_SITES=	http://www.live555.com/liveMedia/public/ \
		https://download.videolan.org/contrib/live555/
DISTNAME=	live.${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	LIVE.COM Streaming Media
WWW=		http://www.live555.com/liveMedia/

LICENSE=	lgpl2.1 MAT
LICENSE_COMB=	multi
LICENSE_NAME_MAT=	dated material
LICENSE_TEXT_MAT=	dated material
LICENSE_PERMS_MAT=	pkg-mirror dist-mirror auto-accept

BROKEN_sparc64=		Fails to compile

WRKSRC=		${WRKDIR}/live

HAS_CONFIGURE=	yes

CONFIGURE_SCRIPT=	genMakefiles
CONFIGURE_ARGS=		fixed-midnightbsd

USES=		compiler:c++11-lang gmake ssl
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fPIC
.else
CFLAGS+=	-fpic
.endif

post-extract:
	${CP} ${FILESDIR}/config.fixed-midnightbsd ${WRKSRC}

post-patch:
	# LIBS_FOR_CONSOLE_APPLICATION = -lssl -lcrypto
	${REINPLACE_CMD} '/LIBS_FOR_CONSOLE_APPLICATION/s|$$|-L${OPENSSLLIB} -lssl -lcrypto|' \
		${WRKSRC}/config.fixed-midnightbsd

.if ${PREFIX} != "/usr/local"
post-configure:
	${REINPLACE_CMD} -e 's,^PREFIX = /usr/local,PREFIX = "${PREFIX}",' \
		${WRKSRC}/Makefile ${WRKSRC}/*/Makefile
.endif

.include <bsd.port.post.mk>
