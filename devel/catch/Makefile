PORTNAME=	catch
PORTVERSION=	2.13.10
DISTVERSIONPREFIX=	v
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Header-only test framework for C++
WWW=		https://github.com/catchorg/Catch2

LICENSE=	BSL-1.0
LICENSE_FILE=	${WRKSRC}/LICENSE.txt

USES=		cmake compiler:c++14-lang pathfix python:build

USE_GITHUB=	yes
GH_ACCOUNT=	catchorg
GH_PROJECT=	Catch2

CMAKE_ARGS=	-DCMAKE_INSTALL_DOCDIR=${DOCSDIR}
NO_ARCH=	yes

PORTSCOUT=	limit:^2\.

OPTIONS_DEFINE=	DOCS

do-test:
	${BUILD_WRKSRC}/projects/SelfTest

.include <bsd.port.mk>
