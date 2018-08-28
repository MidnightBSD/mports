# $MidnightBSD$
# $FreeBSD: head/devel/qt5-script/Makefile 413746 2016-04-21 16:43:14Z swills $

PORTNAME=	script
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 4-compatible scripting module

LICENSE=	gpl3

USE_QT5=	core buildtools_build
QT_DIST=	${PORTNAME}
USES=		qmake
# Keep make(1) from descending into src/script/obj/ (qmake:outsource
# doesn't work).
MAKE_ENV=	MAKEOBJDIR=.
USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-patch:
	@${REINPLACE_CMD} -e '/scripttools/ d' \
		${WRKSRC}/src/src.pro

.include <bsd.port.mk>
