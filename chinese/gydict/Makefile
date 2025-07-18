PORTNAME=	gydict
PORTVERSION=	1.0
DISTVERSIONPREFIX=	v
PORTREVISION=	1
CATEGORIES=	chinese textproc python

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command line tool of Yahoo! Dictionary
WWW=		https://github.com/iamgyz/gydict

LICENSE=	mit

USES=		python:run shebangfix
SHEBANG_FILES=	gydict.py

USE_GITHUB=	yes
GH_ACCOUNT=	iamgyz

NO_BUILD=	yes
NO_ARCH=	yes

PLIST_FILES=	bin/gydict

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/gydict.py ${STAGEDIR}${PREFIX}/bin/gydict

.include <bsd.port.mk>
