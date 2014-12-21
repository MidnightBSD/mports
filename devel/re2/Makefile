# $MidnightBSD$ 

PORTNAME=	re2
PORTVERSION=	20140304
CATEGORIES=	devel
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast C++ regex library

LICENSE=	bsd3

MAKE_ARGS=	CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" prefix=${PREFIX}
USE_LDCONFIG=	yes
USES=		compiler:c++11-lang gmake tar:tgz

WRKSRC=		${WRKDIR}/${PORTNAME}

.include <bsd.port.pre.mk>

post-patch:
# remove tr1 if using libc++
.if ${COMPILER_FEATURES:Mlibc++}
	@${REINPLACE_CMD} -e 's|tr1/||; s|tr1::||' ${WRKSRC}/util/util.h
.endif

post-build:
	@${STRIP_CMD} ${WRKSRC}/obj/so/libre2.so

.include <bsd.port.post.mk>
