# $MidnightBSD$

PORTNAME=	portaudio
PORTVERSION=	18.1
PORTREVISION=	5
CATEGORIES=	audio
MASTER_SITES=	http://www.portaudio.com/archives/
DISTNAME=	${PORTNAME}_v${PORTVERSION:S/./_/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Portable cross-platform Audio API

LICENSE=	unknown

USES=		zip gmake
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CPPFLAGS+=	-I${LOCALBASE}/include ${PTHREAD_CFLAGS}
LDFLAGS+=	-L${LOCALBASE}/lib ${PTHREAD_CFLAGS}

PLIST_SUB+=	SHLIB_VERSION=${SHLIB_VERSION}
SHLIB_VERSION=	0

pre-everything::
.if !defined(WITH_PATESTS)
	@${ECHO_MSG}
	@${ECHO_MSG} "You can additionally build portaudio's testsuite by defining WITH_PATESTS."
	@${ECHO_MSG}
PLIST_SUB+=	WITH_PATESTS="@comment "
.else
PLIST_SUB+=	WITH_PATESTS=""
.endif

pre-patch:
# replace \r\n with \n
	@${FIND} ${WRKSRC} -type f \
		| ${XARGS} -x -n 10 \
			${REINPLACE_CMD} -E \
				-e 's|||'
post-patch:
	@${REINPLACE_CMD} -e 's|#include <malloc.h>|#include <stdlib.h>|' ${WRKSRC}/pa_unix_oss/pa_unix.h
	@${REINPLACE_CMD} -e 's|machine/soundcard.h|sys/soundcard.h|' ${WRKSRC}/pa_unix_oss/pa_unix_oss.c
	@${REINPLACE_CMD} -e 's|-lpthread|${PTHREAD_LIBS}|g' ${WRKSRC}/configure ${WRKSRC}/configure.in \
		${WRKSRC}/pa_unix_oss/Makefile

pre-configure:
	@${CHMOD} +x ${WRKSRC}/configure

.if !defined(WITH_PATESTS)
post-configure:
	@${REINPLACE_CMD} -e 's|tests$$||' ${WRKSRC}/Makefile
.endif

post-install:
.if defined(WITH_PATESTS)
	@${INSTALL_PROGRAM} ${WRKSRC}/bin/* ${PREFIX}/bin
.endif
	@${LN} -sf libportaudio.so \
		${PREFIX}/lib/libportaudio.so.${SHLIB_VERSION}

.include <bsd.port.mk>
