PORTNAME=	freealut
PORTVERSION=	1.1.0
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	DEBIAN_POOL
DISTNAME=	freealut_${PORTVERSION}.orig

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The OpenAL Utility Toolkit
WWW=		http://connect.creativelabs.com/openal/default.aspx

LICENSE=	lgpl

USES=		gmake libtool pathfix pkgconfig
GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
USE_OPENAL=	al
USE_LDCONFIG=	yes
LDFLAGS_i386=	-Wl,-znotext
INSTALL_TARGET=	install-strip
LLD_UNSAFE=     yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

.include <bsd.port.pre.mk>

post-patch:
	@${REINPLACE_CMD} -e 's/@CFLAGS@/& -lopenal -lpthread/g' \
		${WRKSRC}/examples/Makefile.in \
		${WRKSRC}/test_suite/Makefile.in

.include <bsd.port.post.mk>
