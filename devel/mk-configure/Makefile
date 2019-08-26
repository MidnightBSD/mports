PORTNAME=	mk-configure
PORTVERSION=	0.30.0
CATEGORIES=	devel
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight, easy to use replacement for GNU autotools

LICENSE=	bsd2

FAKE_OPTS=	trueprefix

BUILD_DEPENDS=	${BMAKE}:devel/bmake
RUN_DEPENDS:=	${BUILD_DEPENDS} \
		bmkdep:devel/bmkdep

BMAKE?=		${LOCALBASE}/bin/bmake
INSTALL_TARGET=	installdirs install install-doc

PORTEXAMPLES=	*

OPTIONS_DEFINE=	DOCS EXAMPLES

NO_TEST=	yes

post-patch:
	@${ECHO_CMD} "MKDEP ?= bmkdep" >> ${WRKSRC}/mk/sys.mk

do-build:
	${SETENV} ${MAKE_ENV} ${BMAKE} -C ${BUILD_WRKSRC} ${MAKE_FLAGS} \
		${MAKEFILE} ${_MAKE_JOBS} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET}

do-install:
	${SETENV} ${MAKE_ENV} ${FAKE_MAKEENV} ${BMAKE} -C ${INSTALL_WRKSRC} ${MAKE_FLAGS} \
		${MAKEFILE} ${_MAKE_JOBS} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET}
	cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${EXAMPLESDIR}

.include <bsd.port.mk>
