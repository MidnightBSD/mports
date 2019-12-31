PORTNAME=	indexinfo
PORTVERSION=	0.3.1
CATEGORIES=	print ports-mgmt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to regenerate the GNU info page index

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

USE_CSTD=	gnu99

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	bapt
INSTALL_TARGET=	install-strip
PLIST_FILES=	bin/indexinfo

.include <bsd.port.mk>
