PORTNAME=	zyggy
PORTVERSION=	0.1
PORTREVISION=	2
CATEGORIES=	sysutils
MASTER_SITES=	GH

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	ZFS Administration GUI

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		gnome python:3.4+ shebangfix
USE_PYTHON=	noflavors
USE_GNOME=	gtk30 pygobject3

USE_GITHUB=     yes
GH_ACCOUNT=     manoeldesouza
GH_TAGNAME=	8d2982fdd86bba03f700fd4531004aeaad5bce66

NO_ARCH=	yes
NO_BUILD=	yes

SHEBANG_FILES=	zyggy

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin/

.include <bsd.port.mk>
