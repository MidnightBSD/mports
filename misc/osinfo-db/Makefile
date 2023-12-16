PORTNAME=	osinfo-db
PORTVERSION=	20231027
CATEGORIES=	misc
MASTER_SITES=	https://releases.pagure.org/libosinfo/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Osinfo database files
WWW=		https://libosinfo.org/

LICENSE=	gpl2

BUILD_DEPENDS=	osinfo-db-tools>=1.1.0:sysutils/osinfo-db-tools

USES=		tar:xz

NO_ARCH=	yes
NO_BUILD=	yes

do-extract: # nada

do-install:
	osinfo-db-import --root ${FAKE_DESTDIR} --system ${DISTDIR}/${DISTFILES}

.include <bsd.port.mk>
