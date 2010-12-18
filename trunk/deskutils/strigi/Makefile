#
# $MidnightBSD: mports/deskutils/strigi/Makefile,v 1.1 2008/12/05 21:37:49 ctriv Exp $
#

PORTNAME=	strigi
PORTVERSION=	0.7.2
PORTREVISION=	1
CATEGORIES=	deskutils
MASTER_SITES=	http://www.vandenoever.info/software/strigi/ \
		SF/${PORTNAME}/${PORTNAME}/${PORTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Desktop searching program
LICENSE=	gpl2

LIB_DEPENDS=	clucene.0:${PORTSDIR}/textproc/clucene \
		dbus-1:${PORTSDIR}/devel/dbus \
		exiv2:${PORTSDIR}/graphics/exiv2

USE_QT_VER=	4
QT_COMPONENTS=	corelib gui dbus moc_build uic_build qmake_build rcc_build
USE_BZIP2=	yes
USE_GNOME=	libxml2 pkgconfig
# USE_FAM=	yes
USE_LDCONFIG=	yes
USE_CMAKE=	yes
MAKE_JOBS_UNSAFE=	yes

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e \
		's,$${LIB_DESTINATION}/pkgconfig,libdata/pkgconfig,' \
		${WRKSRC}/src/streamanalyzer/CMakeLists.txt \
		${WRKSRC}/src/streams/CMakeLists.txt
	${REINPLACE_CMD} -e \
		's,\[56\],\[567\],' \
		${WRKSRC}/src/xsd/CMakeLists.txt

.include <bsd.port.mk>
