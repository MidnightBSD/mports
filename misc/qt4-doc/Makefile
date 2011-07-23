# $MidnightBSD: mports/misc/qt4-doc/Makefile,v 1.2 2008/10/29 20:28:48 ctriv Exp $
# $FreeBSD: ports/misc/qt4-doc/Makefile,v 1.8 2008/08/04 23:30:36 miwi Exp $

PORTNAME=	doc
PORTVERSION=	${QT4_VERSION}
CATEGORIES?=	misc
PKGNAMEPREFIX=	qt4-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Multiplatform C++ application framework
LICENSE=	gpl3

QT_DIST=	yes
NO_BUILD=	yes

ALL_TARGET=	first
CONFIGURE_ENV?=	QTDIR=${WRKSRC} PATH=${WRKSRC}/bin:$$PATH
MAKE_ENV?=	QTDIR=${WRKSRC} LD_LIBRARY_PATH=${WRKSRC}/lib \
		PATH=${WRKSRC}/bin:$$PATH 

DESTDIRNAME=	INSTALL_ROOT

EXTENSIONS=		qt
QT_BUILD_ENV_ONLY=	yes

EXTRACT_AFTER_ARGS=| ${TAR} -xf - '${DISTNAME}/doc'

DOCSDIR=${PREFIX}/share/doc/qt4

do-install:
	${MKDIR} ${DOCSDIR} && \
	${CP} -Rp ${WRKSRC}/doc/html ${WRKSRC}/doc/qch ${DOCSDIR}

.include <bsd.port.mk>
