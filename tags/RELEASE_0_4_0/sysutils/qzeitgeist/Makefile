# $MidnightBSD$
# $FreeBSD: ports/sysutils/qzeitgeist/Makefile,v 1.2 2011/10/17 00:08:52 avilla Exp $
#

PORTNAME=	qzeitgeist
PORTVERSION=	0.7.0
CATEGORIES=	sysutils
MASTER_SITES=	http://releases.zeitgeist-project.com/${PORTNAME}/
DISTNAME=	QtZeitgeist-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt 4 wrapper library around the Zeitgeist D-Bus API
LICENSE=	lgpl

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib dbus qtestlib \
		moc_build qmake_build rcc_build uic_build
MAKE_JOBS_SAFE=	yes
USE_CMAKE=	yes
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${DISTNAME}-Source

post-patch:
	${REINPLACE_CMD} -e '/\.pc/ s|pkgconfig|../libdata/pkgconfig|' \
		-e 's|share/${PORTNAME}/cmake|lib/cmake/${PORTNAME}|' \
		-e "/add_subdirectory(tests)/ d" \
		${WRKSRC}/CMakeLists.txt \
		${WRKSRC}/src/CMakeLists.txt \
		${WRKSRC}/QZeitgeistConfig.cmake.in

.include <bsd.port.mk>
