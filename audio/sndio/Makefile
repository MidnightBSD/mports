PORTNAME=	sndio
PORTVERSION=	1.9.0
CATEGORIES=	audio
MASTER_SITES=	https://sndio.org/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small audio and MIDI framework from the OpenBSD project
WWW=		https://www.sndio.org/

LICENSE=	iscl

USE_LDCONFIG=	yes
USE_RC_SUBR=	sndiod

HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	--default-dev="rsnd/default" --mandir=${PREFIX}/man \
		--prefix=${PREFIX}

# Parallel build leads to problems, but sndio is very quick to compile
# as is so not worth fixing
MAKE_JOBS_UNSAFE=	yes

USERS=		_sndio
GROUPS=		_sndio

post-patch:
# Make sure sndiod can be started inside jails as root
	@${REINPLACE_CMD} 's|err(1, "setpriority")|warn("setpriority")|' \
		${WRKSRC}/sndiod/sndiod.c

post-install:
	cd ${PREFIX}/bin && ${STRIP_CMD} \
		aucat midicat sndioctl sndiod
	${STRIP_CMD} ${PREFIX}/lib/libsndio.so.7.2

.include <bsd.port.mk>
