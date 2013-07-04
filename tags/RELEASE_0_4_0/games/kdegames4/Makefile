#
# $MidnightBSD: mports/games/kdegames4/Makefile,v 1.1 2008/12/14 04:39:39 ctriv Exp $
#

PORTNAME=	kdegames
PORTVERSION=	${KDE4_VERSION}
PORTREVISION=	1
CATEGORIES=	games kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Games for the KDE integrated X11 desktop
LICENSE=	gpl2

LIB_DEPENDS=	ggzcore.9:${PORTSDIR}/games/ggz-client-libs \
		qca.2:${PORTSDIR}/devel/qca \
		qhull.5:${PORTSDIR}/math/qhull5 \
		sndfile.1:${PORTSDIR}/audio/libsndfile

LATEST_LINK=	${PORTNAME}4

USE_KDE4=	kdehier kdelibs kdeprefix sharedmime automoc4
KDE4_BUILDENV=	yes
USE_OPENAL=	al
USE_QT_VER=	4
QT_COMPONENTS=	dbus gui network opengl qt3support script svg xml \
		moc_build qmake_build rcc_build uic_build
USE_BZIP2=	yes
CMAKE_ARGS+=	-DBUILD_kajongg:BOOL=FALSE
MAKE_JOBS_SAFE=	yes

.include <bsd.mport.options.mk>

post-patch:
	# Prevent updating MIME during build.
	${REINPLACE_CMD} -e '/^update_xdg_mimetypes/ d' \
		${WRKSRC}/palapeli/mime/CMakeLists.txt

post-install:
	@-update-mime-database ${KDE4_PREFIX}/share/mime

.include <bsd.port.mk>
