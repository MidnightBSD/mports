#
# $MidnightBSD: mports/textproc/soprano/Makefile,v 1.3 2008/10/23 14:35:31 laffer1 Exp $
#

PORTNAME=	soprano
PORTVERSION=	2.1.1
PORTREVISION=	1
CATEGORIES=	textproc
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	QT4 RDF framework
LICENSE=	gpl2

LIB_DEPENDS=	clucene.0:${PORTSDIR}/textproc/clucene \
		rdf.0:${PORTSDIR}/textproc/redland

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib dbus qtestlib qmake moc uic rcc network
USE_GNOME=	pkgconfig
USE_LDCONFIG=	yes
USE_CMAKE=	yes

MAKE_ARGS+=	${PTHREASD_LDFLAGS} 
LDFLAGS+=	${PTHREAD_LDFLAGS}

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e "s,$${LIB_SUFFIX}/pkgconfig,data/pkgconfig," \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
