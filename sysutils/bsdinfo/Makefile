# Created by: samu <freebsd-ports@samu.pl>

PORTNAME=	bsdinfo
PORTVERSION=	0.22
CATEGORIES=	sysutils

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple utility to display system-based information

USE_GITHUB=	yes
GH_ACCOUNT=	samupl
GH_TAGNAME=	7ed6607958035244870877191c2764c9ba77f19d

GNU_CONFIGURE=	yes

OPTIONS_DEFINE=	X256
OPTIONS_DEFAULT=X256
X256_DESC=	Build the 256 color version
X256_CONFIGURE_ON=	--x256

PLIST_FILES+=	bin/bsdinfo

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/bsdinfo ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
