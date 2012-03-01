# $MidnightBSD: mports/sysutils/polkit-qt/Makefile,v 1.1 2011/07/31 16:49:22 laffer1 Exp $
# $FreeBSD: ports/sysutils/polkit-qt/Makefile,v 1.4 2011/03/25 10:22:45 avilla Exp $

PORTNAME=	polkit-qt
PORTVERSION=	0.103.0
DISTVERSIONPREFIX=	1-
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/apps/KDE4.x/admin/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Qt4 frontend to PolKit-1
LICENSE=	lgpl

LIB_DEPENDS=	polkit-agent-1.0:${PORTSDIR}/sysutils/polkit

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_LDCONFIG=	yes
USE_KDE4=	automoc4
USE_QT_VER=	4
QT_COMPONENTS=	corelib dbus gui network svg xml  \
		qmake_build moc_build rcc_build uic_build
USE_CMAKE=	yes
# TODO: the next release (post-0.103.0) should have commit 56883bd, which
#       syncs FindGObject.cmake with kdelibs' and should find GObject without
#       requiring us to explicitly set LDFLAGS.
LDFLAGS+=	-L${LOCALBASE}/lib

post-extract:
	${REINPLACE_CMD} -e 's|$${LIB_INSTALL_DIR}/pkgconfig|libdata/pkgconfig|' \
		${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
