PORTNAME=	libcutl
PORTVERSION=	1.11.0
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	https://www.codesynthesis.com/download/xsd/4.2/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	C++ utility library with generic and independent components
WWW=		https://www.codesynthesis.com/projects/libcutl/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	build2>=0.16.0:devel/build2

USES=		compiler:c++2b-lang

OPTIONS_DEFINE=	DOCS

B_CMD=		${LOCALBASE}/bin/b
B_ARGS=		-V -j ${MAKE_JOBS_NUMBER} -J ${MAKE_JOBS_NUMBER}

do-build:
	@cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${B_CMD} configure ${B_ARGS} \
		config.cxx=${CXX} \
		config.cxx.coptions="${CXXFLAGS}" \
		config.cxx.loptions="${LDFLAGS} ${STRIP}" \
		config.bin.lib=shared \
		config.bin.rpath=${TRUE_PREFIX}/lib \
		config.install.chroot=${FAKE_DESTDIR} \
		config.install.root=${TRUE_PREFIX}
do-install:
	@cd ${WRKSRC} && ${SETENV} ${FAKE_MAKEENV} ${B_CMD} install ${B_ARGS}

.include <bsd.port.mk>
