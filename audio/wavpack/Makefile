# $MidnightBSD$

PORTNAME=	wavpack
PORTVERSION=	4.50.1
CATEGORIES=	audio
MASTER_SITES=	http://www.wavpack.com/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio codec for lossless, lossy and hybrid compression
LICENSE=	bsd3

USE_BZIP2=	yes
USE_GNOME=	gnomehack gnometarget pkgconfig
USE_ICONV=	yes
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

OPTIONS=	MMX "Enable MMX optimizations (x86 only)" Off

.include <bsd.port.pre.mk>

.if defined(WITH_MMX) && (${ARCH} == "i386" || ${ARCH} == "amd64") && \
    (${OSVERSION} >= 3000)
CONFIGURE_ARGS+=	--enable-mmx
.else
CONFIGURE_ARGS+=	--disable-mmx
.endif

.include <bsd.port.post.mk>
