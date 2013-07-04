# $MidnightBSD$
# $FreeBSD: ports/sysutils/polkit-kde/Makefile,v 1.6 2012/02/16 15:57:27 ashish Exp $
#

PORTNAME=	polkit-kde
PORTVERSION=	0.99.0
CATEGORIES=	sysutils kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/apps/KDE4.x/admin/
DISTNAME=	${PORTNAME}-agent-1-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE4 frontend to PolKit-1
LICENSE=	gpl2

LIB_DEPENDS=	polkit-qt-agent-1.1:${PORTSDIR}/sysutils/polkit-qt

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_KDE4=	kdehier kdelibs kdeprefix automoc4
USE_QT_VER=	4
QT_COMPONENTS=	moc_build qmake_build rcc_build uic_build
USE_CMAKE=	yes
USE_LDCONFIG=	yes

post-extract:
	${REINPLACE_CMD} -e 's|$${LIB_INSTALL_DIR}/pkgconfig|libdata/pkgconfig|' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
