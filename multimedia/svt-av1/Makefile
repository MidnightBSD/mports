PORTNAME=	svt-av1
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.0
CATEGORIES=	multimedia

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Scalable AV1 encoder

LICENSE=	bsd2 bsd3 mit
LICENSE_COMB=	multi
LICENSE_FILE_bsd2=	${WRKSRC}/LICENSE.md
LICENSE_FILE_bsd3=	${WRKSRC}/third_party/fastfeat/LICENSE
LICENSE_FILE_mit=	${WRKSRC}/third_party/safestringlib/LICENSE

WRKSRC=		${WRKDIR}/SVT-AV1-6e87a1de98281840abebc030781780edd822bae5

BUILD_DEPENDS=	${BUILD_DEPENDS_${ARCH}}
BUILD_DEPENDS_amd64=	nasm:devel/nasm

USES=		cmake compiler:c11
USE_GITLAB=	yes
USE_LDCONFIG=	yes
GL_ACCOUNT=	AOMediaCodec
GL_PROJECT=	SVT-AV1
GL_COMMIT=	6e87a1de98281840abebc030781780edd822bae5
CMAKE_ON=	ENABLE_NASM
CMAKE_OFF=	NATIVE

OPTIONS_DEFINE=	LTO
OPTIONS_DEFAULT=LTO

LTO_CMAKE_BOOL=		CMAKE_INTERPROCEDURAL_OPTIMIZATION
LTO_CMAKE_ON=		-DCMAKE_POLICY_DEFAULT_CMP0069:STRING=NEW
.if exists(/usr/bin/ld.lld) && ${/usr/bin/ld:L:tA} != /usr/bin/ld.lld
# --plugin isn't supported by old GNU ld.bfd in base
LTO_LDFLAGS=		-fuse-ld=lld
.endif

post-patch:
	${REINPLACE_CMD} -e 's/DragonFly/MidnightBSD/g' ${WRKSRC}/third_party/cpuinfo/CMakeLists.txt

.include <bsd.port.mk>
