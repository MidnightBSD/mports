# $MidnightBSD: mports/audio/mpg123/Makefile,v 1.6 2010/02/27 15:42:26 laffer1 Exp $

PORTNAME=	mpg123
PORTVERSION=	1.9.1
CATEGORIES=	audio ipv6
MASTER_SITES=	SF \
		http://www.mpg123.de/download/

MAINTAINER=	ports@midnightbsd.org
COMMENT=	Command-line player for mpeg layer 1, 2 and 3 audio
LICENSE=	gpl2

USE_BZIP2=	yes
USE_AUTOTOOLS=	libltdl
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-audio=oss \
		--with-default-audio=oss
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd6.1
CONFIGURE_ENV=	CONFIG_SHELL=${SH} CFLAGS="${CFLAGS} -I${LOCALBASE}/include" LDFLAGS="-L${LOCALBASE}/lib"

MAN1=		mpg123.1

.include <bsd.port.pre.mk>

.if ${ARCH} == "i386"
.if ${MACHINE_CPU:M3dnow}
WITH_CPU=	3dnow
.elif ${MACHINE_CPU:Msse}
WITH_CPU=	sse
.elif ${MACHINE_CPU:Mi586}
WITH_CPU=	i586
.elif ${MACHINE_CPU:Mi486}
WITH_CPU=	i486
.endif
.endif

.if defined(WITH_CPU)
CONFIGURE_ARGS+=--with-cpu=${WITH_CPU}
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|(libdir)/pkgconfig|(prefix)/libdata/pkgconfig|' ${WRKSRC}/Makefile.in

.include <bsd.port.post.mk>
