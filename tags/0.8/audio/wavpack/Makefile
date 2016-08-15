# $MidnightBSD$

PORTNAME=	wavpack
PORTVERSION=	4.60.1
PORTREVISION=	1
CATEGORIES=	audio
MASTER_SITES=	http://www.wavpack.com/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Audio codec for lossless, lossy and hybrid compression

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/license.txt

USES=		pathfix pkgconfig iconv tar:bzip2
USE_LDCONFIG=	yes
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

MAN1=		wavpack.1 wvgain.1 wvunpack.1

.if ${MACHINE_CPU:Mmmx}
CONFIGURE_ARGS=	--enable-mmx
.endif

.include <bsd.port.mk>
