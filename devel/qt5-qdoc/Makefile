PORTNAME=	qdoc
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	devel textproc
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt documentation generator

LICENSE=	lgpl3

BUILD_DEPENDS=	llvm${LLVM_DEFAULT}>=0:devel/llvm${LLVM_DEFAULT}
RUN_DEPENDS=	llvm${LLVM_DEFAULT}>=0:devel/llvm${LLVM_DEFAULT}

USES=		compiler:c++11-lang qmake qt-dist:5,tools
USE_QT=		core declarative buildtools:build qdoc-data:run

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

CONFIGURE_ENV=	LLVM_INSTALL_DIR=${LOCALBASE}/llvm${LLVM_DEFAULT}

QT_BINARIES=	yes

.include <bsd.port.mk>
