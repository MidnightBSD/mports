PORTNAME=	compiler-benchmark
PORTVERSION=	0.1
DISTVERSIONPREFIX=	v
CATEGORIES=	benchmarks

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Benchmarks compilation speeds

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		python:3.7,run

USE_GITHUB=	yes
GH_ACCOUNT=	nordlow
GH_TAGNAME=	64745c3

NO_BUILD=	yes

PLIST_FILES=	bin/benchmark

.include <bsd.port.pre.mk>

do-install:
	${INSTALL_SCRIPT}  ${WRKSRC}/benchmark ${PREFIX}/bin/benchmark

.include <bsd.port.post.mk>
