# $FreeBSD: head/x11-toolkits/qt5-canvas3d/Makefile 407169 2016-01-24 18:10:14Z rakuco $

PORTNAME=  	canvas3d
DISTVERSION=	${QT5_VERSION}
CATEGORIES=	x11-toolkits
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt canvas3d module

USE_QT5=	core gui network qml quick buildtools_build
QT_DIST=	${PORTNAME}
USES=		qmake

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

post-install:
	${MKDIR} ${STAGEDIR}/usr/local/share/qtcreator/templates/wizards && \
	cd ${WRKSRC}/creatortemplates && \
	${COPYTREE_SHARE} qtcanvas3d ${STAGEDIR}/usr/local/share/qtcreator/templates/wizards && \
	${COPYTREE_SHARE} qtcanvas3dthreejs ${STAGEDIR}/usr/local/share/qtcreator/templates/wizards

.include <bsd.port.mk>
