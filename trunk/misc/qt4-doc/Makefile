# $MidnightBSD: mports/misc/qt4-doc/Makefile,v 1.4 2012/03/01 01:37:31 laffer1 Exp $

PORTNAME=	doc
DISTVERSION=	${QT4_VERSION}
CATEGORIES?=	misc
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multiplatform C++ application framework

LICENSE=	gpl3

USE_QT4=	# empty
QT_DIST=	yes
NO_BUILD=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH 

DESTDIRNAME=	INSTALL_ROOT

EXTENSIONS=		qt
QT_BUILD_ENV_ONLY=	yes

EXTRACT_AFTER_ARGS=	 '${DISTNAME}/doc'

DOCSDIR=	${PREFIX}/share/doc/qt4

do-install:
	${MKDIR} ${DOCSDIR} && \
	cd ${WRKSRC}/doc && ${COPYTREE_SHARE} html ${DOCSDIR} && \
	${COPYTREE_SHARE} qch ${DOCSDIR}

.include <bsd.port.mk>
