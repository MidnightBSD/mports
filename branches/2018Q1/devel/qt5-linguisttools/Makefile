# $MidnightBSD$
# $FreeBSD: head/devel/qt5-linguisttools/Makefile 408682 2016-02-11 10:34:38Z rakuco $

PORTNAME=	linguisttools
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt localization tools

LICENSE=	gpl3

USE_QT5=	core xml buildtools_build qml_build
QT_DIST=	tools
USES=		qmake

BUILD_WRKSRC=	${WRKSRC}/src/linguist
INSTALL_WRKSRC=	${WRKSRC}/src/linguist

post-patch:
	@${REINPLACE_CMD} -e '/SUBDIRS.*linguist/ d' \
		${WRKSRC}/src/linguist/linguist.pro

post-install:
.for f in lrelease lupdate
	${INSTALL_MAN} ${WRKSRC}/src/linguist/${f}/${f}.1 \
		${STAGEDIR}${MANPREFIX}/man/man1
.endfor

.include <bsd.port.mk>
