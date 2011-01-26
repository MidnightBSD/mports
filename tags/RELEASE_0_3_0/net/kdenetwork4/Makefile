#
# $MidnightBSD: ports/net/kdenetwork4/Makefile,v 1.135 2008/09/03 13:06:19 miwi Exp $

PORTNAME=	kdenetwork
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	net kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	stable/${PORTVERSION}/src
DIST_SUBDIR=	KDE

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	KDE Network applications
LICENSE=	gpl2

LIB_DEPENDS=	slp:${PORTSDIR}/net/openslp \
		idn:${PORTSDIR}/dns/libidn \
		qimageblitz.4:${PORTSDIR}/x11/qimageblitz \
		qca.2:${PORTSDIR}/devel/qca \
		otr.4:${PORTSDIR}/security/libotr \
		vncserver.0:${PORTSDIR}/net/libvncserver
RUN_DEPENDS=	qca-ossl>=2.0.0.b3:${PORTSDIR}/security/qca-ossl

LATEST_LINK=	${PORTNAME}4

USE_BZIP2=	yes
USE_KDE4=	kdelibs pimlibs workspace kdeprefix kdehier automoc4
KDE4_BUILDENV=	yes
USE_QT_VER=	4
USE_SQLITE=	yes
QT_COMPONENTS=	corelib opengl moc rcc uic dbus qt3support gui network porting uic3 xml
USE_OPENSSL=	yes

post-extract:
	${MKDIR} ${WRKSRC}

.include <bsd.port.mk>
