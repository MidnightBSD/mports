PORTNAME=	afdko
PORTVERSION=	5.0.1
CATEGORIES=	x11-fonts python
MASTER_SITES=	PYPI \
		https://github.com/adobe-type-tools/afdko/releases/download/${PORTVERSION}/
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
PKGNAMESUFFIX=	-native

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Adobe Font Development Kit for OpenType (AFDKO)
WWW=		https://github.com/adobe-type-tools/afdko

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE.md

LIB_DEPENDS=	libantlr4-runtime.so:devel/antlr4-cpp-runtime

USES=		cmake compiler:c++11-lang gnome python:3.10+
USE_GNOME=	libxml2
USE_PYTHON=	cython flavors

CMAKE_ARGS=	-DSKBUILD_PROJECT_VERSION=${PORTVERSION}
CMAKE_OFF=	SKBUILD
PLIST_FILES=	${PYTHON_SITELIBDIR}/afdko/_internal${PYTHON_TAG}.so

post-patch:
	@${RM} -r ${WRKSRC}/third_party/

.include <bsd.port.mk>
