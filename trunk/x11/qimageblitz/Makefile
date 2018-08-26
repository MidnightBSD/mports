# $MidnightBSD$

PORTNAME=	qimageblitz
PORTVERSION=	0.0.6
PORTREVISION=	3
CATEGORIES=	x11
MASTER_SITES=	KDE/stable/${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Graphical effects and filters library for KDE4

LICENSE=	bsd2

USE_LDCONFIG=	yes
USE_QT4=	corelib gui qmake_build moc_build uic_build rcc_build
USES=		cmake qt:4 tar:bzip2
USE_CXXSTD=	gnu++98

post-patch:
	${MKDIR} ${WRKSRC}
	${REINPLACE_CMD} -e \
		's,$${LIB_INSTALL_DIR}/pkgconfig,libdata/pkgconfig,' \
		${WRKSRC}/blitz/CMakeLists.txt

.include <bsd.port.mk>
