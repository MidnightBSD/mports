# $MidnightBSD$

PORTNAME=	indexinfo
PORTVERSION=	0.2.4
CATEGORIES=	print ports-mgmt

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to regenerate the GNU info page index

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/COPYING

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

FAKE_OPTS=	trueprefix

USE_GITHUB=	yes
GH_ACCOUNT=	bapt
INSTALL_TARGET=	install-strip
PLIST_FILES=	bin/indexinfo

.include <bsd.port.mk>
