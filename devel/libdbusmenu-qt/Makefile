# $MidnightBSD$
# $FreeBSD: ports/devel/libdbusmenu-qt/Makefile,v 1.4 2011/03/25 10:16:44 avilla Exp $

PORTNAME=	libdbusmenu-qt
PORTVERSION=	0.8.0
CATEGORIES=	devel
MASTER_SITES=	http://launchpad.net/${PORTNAME}/trunk/${PORTVERSION}/+download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt4 implementation of the DBusMenu protocol
LICENSE=	lgpl

FETCH_ARGS=	-Fpr
USE_BZIP2=	yes
USE_CMAKE=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus gui xml \
		moc_build qmake_build rcc_build uic_build
USE_LDCONFIG=	yes

CMAKE_OUTSOURCE=	yes
MAKE_JOBS_SAFE=	yes

post-patch:
	@${REINPLACE_CMD} -e '/pkgconfig/ s/$${LIB_SUFFIX}/data/' \
		-e '/tests/ d' -e '/tools/ d' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
