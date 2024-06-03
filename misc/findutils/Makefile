PORTNAME=	findutils
PORTVERSION=	4.9.0
CATEGORIES=	misc
MASTER_SITES=	GNU
DISTFILES=	${DISTNAME}${EXTRACT_SUFX}
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU find utilities
WWW=		https://www.gnu.org/software/findutils/

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		charsetfix cpe gmake localbase tar:xz

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--program-prefix=g --localstatedir=${LOCALSTATEDIR}
MAKE_ARGS=	INSTALL_SCRIPT="${INSTALL_SCRIPT}"
INFO=		find find-maint

CPE_VENDOR=	gnu

OPTIONS_DEFINE=	NLS
OPTIONS_SUB=	yes
NLS_CONFIGURE_ENABLE=	nls
NLS_USES=	gettext

LOCALSTATEDIR?=	/var/db

.include <bsd.port.mk>
