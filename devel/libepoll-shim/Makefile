# Created by: Johannes Lundberg <johalun0@gmail.com>

PORTNAME=	libepoll-shim
PORTVERSION=	0.0.20200602
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small epoll implementation using kqueue

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		cmake compiler:c++17-lang
USE_LDCONFIG=	yes
USE_GITHUB=	yes
GH_ACCOUNT=	jiixyj
GH_PROJECT=	epoll-shim
GH_TAGNAME=	3840e9c

CC=	clang70
MAKE_ENV+=	CC=clang70
LLVM_DEFAULT=   70                                                                                                                                                        
BUILD_DEPENDS+= llvm${LLVM_DEFAULT}>=3.9.0_4:devel/llvm${LLVM_DEFAULT}                                                                                                    
RUN_DEPENDS+=   llvm${LLVM_DEFAULT}>=3.9.0_4:devel/llvm${LLVM_DEFAULT}                                                                                                    
CONFIGURE_ENV+= LLVM_CONFIG=${LOCALBASE}/bin/llvm-config${LLVM_DEFAULT}                                                                                                   
LDFLAGS+=       -Wl,-rpath=${LOCALBASE}/llvm${LLVM_DEFAULT}/lib   

NO_TEST=	yes

.include <bsd.port.mk>
