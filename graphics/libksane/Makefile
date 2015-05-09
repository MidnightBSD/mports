# $MidnightBSD$
# $FreeBSD: ports/graphics/libksane/Makefile,v 1.2 2012/02/16 15:56:59 ashish Exp $

PORTNAME=	libksane
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	graphics kde
MASTER_SITES=	KDE/${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE/${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	SANE library interface for KDE
LICENSE=	gpl2

LIB_DEPENDS=	libsane.so:${PORTSDIR}/graphics/sane-backends

USE_KDE4=	kdelibs kdeprefix automoc4
USES=		cmake:outsource tar:xz
USE_QT4=	moc_build qmake_build rcc_build uic_build
USE_LDCONFIG=	yes

pre-configure:
	${REINPLACE_CMD} -e '/pkgconfig/ s/$${LIB_INSTALL_DIR}/libdata/' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
