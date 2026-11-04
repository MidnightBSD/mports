PORTNAME=	mesquite
DISTVERSION=	2.3.0
PORTREVISION=	1
CATEGORIES=	math
MASTER_SITES=	https://github.com/sandialabs/mesquite/raw/main/mesquite/
PKGNAMESUFFIX=	-mesh-toolkit

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Mesh Quality Improvement Toolkit is a suite of mesh algorithms
WWW=		https://www.sandia.gov/ccr/project/mesquite/

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/lgpl.txt

USES=		gmake libtool
USE_LDCONFIG=	yes
USE_CXXSTD=	c++11 # attempt to fix build failing due to the use of std::unary_function that was removed in c++17

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share
CONFIGURE_ARGS=	--enable-shared --disable-static

INSTALL_TARGET=	install-strip
TEST_TARGET=	check

OPTIONS_DEFINE=	EXAMPLES

PORTEXAMPLES=	*

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	@${MV} ${FAKE_DESTDIR}${DOCSDIR}/examples/* ${FAKE_DESTDIR}${EXAMPLESDIR}
	@${RM} -r ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-off:
	@${RM} -r ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
