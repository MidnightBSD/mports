PORTNAME=	gershwin-workspace
DISTVERSION=	20260129
CATEGORIES=	deskutils gnustep

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Gershwin workspace manager
WWW=		https://github.com/gershwin-desktop/gershwin-workspace

LICENSE=	gpl2

LIB_DEPENDS=	libdbus-1.so:devel/dbus

USES=		gershwin pkgconfig xorg
CONFLICTS=	gworkspace
USE_GERSHWIN=	back build
USE_XORG=	x11
USE_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

USE_GITHUB=	yes
GH_ACCOUNT=	gershwin-desktop
GH_TAGNAME=	1bc3b988

GNU_CONFIGURE=	yes

pre-configure:
	${RM} -r ${WRKSRC}/GWMetadata

post-install:
	${GZIP_CMD} ${FAKE_DESTDIR}/System/Library/Documentation/man/man1/dsutil.1

.include <bsd.port.mk>
