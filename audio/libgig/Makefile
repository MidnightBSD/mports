

PORTNAME=	libgig
DISTVERSION=	4.1.0
CATEGORIES=	audio
MASTER_SITES=	SF/qsampler/${PORTNAME}/${PORTVERSION} \
		http://download.linuxsampler.org/packages/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gigasampler file loader library

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_aarch64=		fails to compile: DLS.cpp:526:9: unknown type name 'uuid_t'; did you mean 'uid_t'?

LIB_DEPENDS=	libsndfile.so:audio/libsndfile \
		libuuid.so:misc/e2fsprogs-libuuid

USES=		gmake libtool pathfix pkgconfig tar:bzip2
GNU_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/lib/libgig
INSTALL_TARGET=	install-strip
MAKE_JOBS_UNSAFE=	yes

.include <bsd.port.mk>
