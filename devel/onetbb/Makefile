PORTNAME=	onetbb
PORTVERSION=	2021.7.0
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library that provides thread building blocks
WWW=		https://software.intel.com/oneapi/onetbb

LICENSE=	Apache-2.0

LIB_DEPENDS=	libhwloc.so.15:devel/hwloc2

USES=		cmake compiler:c++11-lang tar:tgz

CMAKE_ARGS+=	-DTBB_STRICT:BOOL=FALSE \
		-DCMAKE_INSTALL_DOCDIR:PATH="${DOCSDIR}" \
		-DCMAKE_HWLOC_2_LIBRARY_PATH:PATH="${LOCALBASE}/lib/libhwloc.so" \
		-DCMAKE_HWLOC_2_INCLUDE_PATH:PATH="${LOCALBASE}/include"

CONFLICTS=	tbb

USE_GITHUB=	yes
GH_ACCOUNT=	oneapi-src
GH_PROJECT=	oneTBB

USE_LDCONFIG=	yes

PORTDOCS=	README.md

OPTIONS_DEFINE=	DOCS

# Pkgconfig: tbb.pc (on 64bit arch) vs tbb32.pc
PLIST_SUB=	PCSUFX="${PCSUFX}"

.include <bsd.port.pre.mk>

.if ${ARCH} == i386 || ${ARCH:Marmv?}
PCSUFX=	32
.endif

.include <bsd.port.post.mk>
