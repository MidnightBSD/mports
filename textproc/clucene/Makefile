PORTNAME=	clucene
PORTVERSION=	2.3.3.4
PORTREVISION=	3
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}-core-unstable/2.3
DISTNAME=	${PORTNAME}-core-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CLucene is a C++ port of Lucene

LICENSE=	Apache-2.0 lgpl2.1
LICENSE_COMB=	dual

BUILD_DEPENDS=	${LOCALBASE}/lib/libboost_regex.a:devel/boost-libs

USES=		cmake iconv ninja
USE_LDCONFIG=	yes

CMAKE_ARGS=	-DBUILD_CONTRIBS_LIB=ON
CXXFLAGS+=	-D__LONG_LONG_SUPPORTED -D_WCHAR_H_CPLUSPLUS_98_CONFORMANCE_

post-patch:
	@${REINPLACE_CMD} -e 's|%%DATADIR%%|${DATADIR_REL}|' \
	    ${WRKSRC}/src/core/CMakeLists.txt

.include <bsd.port.mk>
