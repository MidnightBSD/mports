# $MidnightBSD: mports/x11-toolkits/attica/Makefile,v 1.1 2011/07/24 17:06:14 laffer1 Exp $
# $FreeBSD: ports/x11-toolkits/attica/Makefile,v 1.7 2011/03/25 10:17:52 avilla Exp $

PORTNAME=	attica
PORTVERSION=	0.2.9
PORTEPOCH=	2
CATEGORIES=	x11-toolkits
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTNAME}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Collaboration Services API library
LICENSE=	lgpl

USE_QT_VER=	4
QT_COMPONENTS=	dbus network moc_build uic_build rcc_build qmake_build
USE_BZIP2=	yes
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
USE_CMAKE=	yes
MAKE_JOBS_SAFE=	yes

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e \
		's,$${LIB_DESTINATION}/pkgconfig,libdata/pkgconfig,' \
		${WRKSRC}/lib/CMakeLists.txt

.include <bsd.port.mk>
