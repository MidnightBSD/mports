PORTNAME=	libxsd
DISTVERSION=	4.2.0
CATEGORIES=	devel
MASTER_SITES=	https://www.codesynthesis.com/download/xsd/${DISTVERSION:R}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XSD runtime library
WWW=		https://www.codesynthesis.com/projects/xsd/

LICENSE=		FLOSSE gpl2
LICENSE_COMB=		dual
LICENSE_NAME_FLOSSE=	FLOSS Exception
LICENSE_FILE_FLOSSE=	${WRKSRC}/FLOSSE
LICENSE_PERMS_FLOSSE=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

BUILD_DEPENDS=	build2>=0:devel/build2
RUN_DEPENDS=	expat>=2.4.9:textproc/expat2 \
		xerces-c3>=3.2.4:textproc/xerces-c3

USES=		pkgconfig

NO_ARCH=	yes
NO_CCACHE=	yes

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
