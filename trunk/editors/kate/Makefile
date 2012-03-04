# $MidnightBSD$
# $FreeBSD: ports/editors/kate/Makefile,v 1.2 2012/02/16 15:56:51 ashish Exp $

PORTNAME=	kate
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	editors kde
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Basic editor framework for the KDE system
LICENSE=	gpl2

CONFLICTS=	kdebase-4.[0-6].* kdelibs-4.[0-6].* kdesdk-4.[0-6].*

USE_BZIP2=	yes
USE_GETTEXT=	yes
USE_KDE4=	kdelibs kdeprefix kdehier automoc4 sharedmime
KDE4_BUILDENV=	yes
USE_PERL5_BUILD=	yes
USE_QT_VER=	4
QT_COMPONENTS=	dbus gui qt3support script sql xml \
		moc_build qmake_build rcc_build uic_build
MAKE_JOBS_SAFE=	yes

MAN1=	kate.1

post-patch:
	# Prevent updating MIME during build.
	${REINPLACE_CMD} -e '/^update_xdg_mimetypes/ d; /SharedMimeInfo/ d' \
		${PATCH_WRKSRC}/kate/plugins/snippets_tng/CMakeLists.txt

.include <bsd.port.mk>
