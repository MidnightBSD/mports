# $MidnightBSD: mports/textproc/soprano/Makefile,v 1.8 2012/03/01 13:16:52 laffer1 Exp $

PORTNAME=	soprano
PORTVERSION=	2.9.0
CATEGORIES=	textproc
MASTER_SITES=	SF/${PORTNAME}/Soprano/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	QT4 RDF framework
LICENSE=	gpl2

LIB_DEPENDS=	raptor2:${PORTSDIR}/textproc/raptor2 \
		rdf:${PORTSDIR}/textproc/redland \
		iodbc:${PORTSDIR}/databases/libiodbc

USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib dbus qtestlib network \
		qmake_build moc_build uic_build rcc_build
USE_PKGCONFIG=	both
USE_CMAKE=	yes
CMAKE_ARGS+=	-DSOPRANO_DISABLE_CLUCENE_INDEX=yes \
		-DSOPRANO_DISABLE_SESAME2_BACKEND=yes
MAKE_JOBS_SAFE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.pre.mk>

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e "s,$${LIB_SUFFIX}/pkgconfig,data/pkgconfig," \
		${WRKSRC}/CMakeLists.txt
	${REINPLACE_CMD} -e "s,soprano/cmake,cmake/Modules," \
		${WRKSRC}/cmake/modules/CMakeLists.txt

.include <bsd.port.post.mk>
