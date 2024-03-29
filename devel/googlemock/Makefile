PORTNAME=	googlemock
DISTVERSIONPREFIX=	release-
DISTVERSION=	1.8.1
CATEGORIES=	devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Library for writing and using C++ mock classes

LICENSE=	bsd3
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${LOCALBASE}/share/aclocal/ax_pthread.m4:devel/autoconf-archive \
		googletest>=1.8.0:devel/googletest
LIB_DEPENDS=	libgtest.so:devel/googletest

USE_GITHUB=	yes
GH_ACCOUNT=	google
GH_PROJECT=	googletest

USES=		autoreconf compiler:c++11-lang libtool localbase python:run shebangfix
SHEBANG_FILES=	scripts/gmock_doctor.py
WRKSRC_SUBDIR=	${PORTNAME}
GNU_CONFIGURE=	yes
# fused-src python tests are only useful for bundling. There's no point in
# running them before installing system-wide without source files.
CONFIGURE_ENV=	ac_cv_path_PYTHON=":"
INSTALL_TARGET=	install-strip
USE_LDCONFIG=	yes

NO_TEST=	yes

post-patch:
	@${REINPLACE_CMD} '/acx_pthread.m4/d' ${WRKSRC}/configure.ac
# enable vendor make install again (revert 52277c9)
	@${REINPLACE_CMD} -E 's/install-(exec|data)-local/&-dummy/' \
		${WRKSRC}/Makefile.am

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/gmock-config ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/scripts/gmock_doctor.py ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
