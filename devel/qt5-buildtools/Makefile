PORTNAME=	buildtools
PORTVERSION=	${QT5_VERSION}${QT5_KDE_PATCH}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt build tools

USES=		compiler:c++11-lang libtool perl5 qmake:no_env qt-dist:5,base
USE_PERL5=	extract
HAS_CONFIGURE=	yes
CONFIGURE_ARGS=	-no-gui -no-xcb
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

QT_BINARIES=	yes

BUILD_WRKSRC=	${WRKSRC}/src/tools/bootstrap
INSTALL_WRKSRC=	${BUILD_WRKSRC}

MORE_WRKSRCS=	src/tools/moc \
		src/tools/rcc

post-configure:
.for d in src/tools/bootstrap ${MORE_WRKSRCS}
	${MKDIR} ${WRKSRC}/${d}
	cd ${WRKSRC}/${d} && ${SETENV} ${QMAKE_ENV} ${_QMAKE} ${QMAKE_ARGS} ${FAKE_MAKEARGS} ${WRKSRC}/${d}
.endfor

post-build:
.for d in ${MORE_WRKSRCS}
	@cd ${WRKSRC}/${d} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${_MAKE_JOBS} ${MAKE_ARGS} ${ALL_TARGET}
.endfor

post-install:
.for d in ${MORE_WRKSRCS}
	@cd ${WRKSRC}/${d} && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${FAKE_MAKEFLAGS} ${MAKEFILE} \
		${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET}
.endfor
	${MKDIR} ${PREFIX}/${QT_BINDIR_REL}
	${INSTALL_SCRIPT} ${WRKSRC}/bin/syncqt.pl \
		${STAGEDIR}${PREFIX}/${QT_BINDIR_REL}/syncqt.pl
	${RLN} ${STAGEDIR}${QT_BINDIR}/moc ${STAGEDIR}${PREFIX}/bin/moc-qt5
	${RLN} ${STAGEDIR}${QT_BINDIR}/rcc ${STAGEDIR}${PREFIX}/bin/rcc-qt5
.include <bsd.port.mk>
