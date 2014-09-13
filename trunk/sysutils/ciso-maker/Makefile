# $MidnightBSD: trunk/sysutils/ciso/Makefile 15462 2013-09-17 03:15:41Z laffer1 $

PORTNAME=	ciso-maker
PORTVERSION=	1.03
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to compress ISO images to CSO format

LICENSE=	gpl2 gpl3
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/license

WRKSRC=		${WRKDIR}/laffer1-ciso-maker-df63e07
USE_GITHUB=     yes
GH_PROJECT=     ${PORTNAME}
GH_ACCOUNT=     laffer1
GH_TAGNAME=     ${PORTVERSION}
GH_COMMIT=      1ad2a3f

FAKE_OPTS=	trueprefix

PLIST_FILES=	bin/ciso-maker man/man1/ciso-maker.1.gz

.include <bsd.port.mk>
