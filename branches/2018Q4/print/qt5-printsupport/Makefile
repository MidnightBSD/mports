# $MidnightBSD$
# $FreeBSD: head/print/qt5-printsupport/Makefile 412348 2016-04-01 14:16:16Z mat $

PORTNAME=	printsupport
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	1
CATEGORIES=	print
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt print support module

LICENSE=	gpl3

USE_QT5=	core gui widgets qmake_build buildtools_build
QT_DIST=	base
HAS_CONFIGURE=	yes
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

BUILD_WRKSRC=	${WRKSRC}/src/${PORTNAME}
INSTALL_WRKSRC=	${BUILD_WRKSRC}

OPTIONS_DEFINE=	CUPS
OPTIONS_DEFAULT=CUPS
OPTIONS_SUB=	yes

CUPS_CONFIGURE_ON=	-cups
CUPS_CONFIGURE_OFF=	-no-cups
CUPS_LIB_DEPENDS=	libcups.so:print/cups

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MCUPS}
QT_DEFINES+=	CUPS
QT_CONFIG+=	cups
.else
QT_DEFINES+=	-CUPS
QT_CONFIG+=	-cups
.endif

post-configure:
.if ${PORT_OPTIONS:MCUPS}
	@cd ${WRKSRC}/src/plugins/${PORTNAME}/cups && \
		${SETENV} ${QMAKE_ENV} ${WRKSRC}/bin/qmake ${QMAKE_ARGS}
.endif

post-build:
.if ${PORT_OPTIONS:MCUPS}
	@cd ${WRKSRC}/src/plugins/${PORTNAME}/cups && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${_MAKE_JOBS} ${MAKE_ARGS} ${FAKE_MAKEARGS} ${ALL_TARGET}
.endif

post-install:
.if ${PORT_OPTIONS:MCUPS}
	@cd ${WRKSRC}/src/plugins/${PORTNAME}/cups && \
		${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} \
		${MAKE_ARGS} ${FAKE_MAKEARGS} ${INSTALL_TARGET}
.endif

.include <bsd.port.mk>
