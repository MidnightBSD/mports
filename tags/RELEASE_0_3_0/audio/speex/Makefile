# $MidnightBSD: mports/audio/speex/Makefile,v 1.7 2009/11/25 02:33:42 laffer1 Exp $

PORTNAME=	speex
DISTVERSION=	1.2rc1
PORTREVISION=	2
PORTEPOCH=	1
CATEGORIES=	audio
MASTER_SITES=	http://downloads.us.xiph.org/releases/speex/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An open-source patent-free voice codec
LICENSE=	bsd3

LIB_DEPENDS=	ogg.7:${PORTSDIR}/audio/libogg

CONFLICTS=	speex-devel-[0-9]*

MAKE_JOBS_SAFE=	yes

USE_GNOME=	gnomehack gnometarget ltverhack
USE_LDCONFIG=	yes
USE_AUTOTOOLS=	libtool:22
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-ogg-dir=${LOCALBASE} \
		--build=${ARCH}-portbld-freebsd6.0
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		speexdec.1 speexenc.1

.include <bsd.port.pre.mk>

.if ${MACHINE_CPU:Msse}!=""
CONFIGURE_ARGS+=	--enable-sse
.endif

post-patch:
	@${FIND} ${WRKSRC} -name "Makefile.in" | ${XARGS} ${REINPLACE_CMD} -e \
		's|doc win32|win32|g ; \
		s|^mandir =.*$$|mandir = @mandir@|g'
	@${REINPLACE_CMD} -e 's|malloc.h|stdlib.h|' \
		${WRKSRC}/*/*.h
	@${REINPLACE_CMD} -e 's| in -lgnugetopt||g ; \
		 s|LIBS="-lgnugetopt|LIBS="|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
