# $MidnightBSD: mports/deskutils/kdepimlibs4/Makefile,v 1.1 2008/12/10 15:44:43 ctriv Exp $

PORTNAME=	kdepimlibs
PORTVERSION=	${KDE4_VERSION}
PORTREVISION=	1
CATEGORIES=	deskutils kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Libraries for KDE-PIM applications
LICENSE=	lgpl

LIB_DEPENDS=	gpgme:${PORTSDIR}/security/gpgme \
		sasl2:${PORTSDIR}/security/cyrus-sasl2 \
		boost_python:${PORTSDIR}/devel/boost-python-libs

USE_KDE4=	kdelibs akonadi kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_BZIP2=	yes
USE_QT_VER=	4
QT_COMPONENTS=	corelib opengl moc rcc uic dbus qt3support designer network svg \
		qtestlib help
USE_OPENLDAP=	yes

.if exists(${LOCALBASE}/lib/libgpgme-pth.so)
PLIST_SUB+=	WITH_PTH=''
.else
PLIST_SUB+=	WITH_PTH='@comment '
.endif

post-extract:
	${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
