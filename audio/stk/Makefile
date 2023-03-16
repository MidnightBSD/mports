PORTNAME=	stk
PORTVERSION=	4.6.2
CATEGORIES=	audio
MASTER_SITES=	http://ccrma.stanford.edu/software/stk/release/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Synthesis ToolKit in C++
WWW=		https://ccrma.stanford.edu/software/stk

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libjack.so:audio/jack

USES=		autoreconf compiler:c++11-lang dos2unix gmake localbase pkgconfig
USE_LDCONFIG=	yes

DOS2UNIX_GLOB=	*.cpp *.h

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-jack --with-oss

MAKE_ARGS=	RAWWAVES=${DATADIR}/rawwaves/

LDFLAGS+=	-pthread

post-install:
	@cd ${WRKSRC} && ${COPYTREE_SHARE} rawwaves ${DATADIR}
	@${RM} ${DATADIR}/rawwaves/._* ${DATADIR}/rawwaves/*.c
	@${STRIP_CMD} ${PREFIX}/lib/libstk-${PORTVERSION}.so

.include <bsd.port.mk>
