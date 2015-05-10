# $MidnightBSD$

PORTNAME=	libuninum
PORTVERSION=	2.7
CATEGORIES=	devel
MASTER_SITES=	http://billposer.org/Software/Downloads/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for converting Unicode strings to numbers

LICENSE=	lgpl2.1

LIB_DEPENDS=	libgmp.so:${PORTSDIR}/math/gmp

GNU_CONFIGURE=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LIBS+=		-L${LOCALBASE}/lib
INSTALL_TARGET=	install-strip
USES=		libtool
USE_LDCONFIG=	yes

post-patch:
	${REINPLACE_CMD} -e 's|uninum/||' ${WRKSRC}/uninum.c ${WRKSRC}/numconv.c

.include <bsd.port.mk>
