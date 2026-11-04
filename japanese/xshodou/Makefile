PORTNAME=	xshodou
PORTVERSION=	1.11
PORTREVISION=	5
CATEGORIES=	japanese tk
MASTER_SITES=	http://kozos.jp/myfreesoft/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Japanese shodou program for X based on Tcl/Tk
WWW=		https://kozos.jp/myfreesoft/

LICENSE=	xshodou
LICENSE_NAME=	xshodou
LICENSE_FILE=	${WRKSRC}/COPYRIGHT
LICENSE_PERMS=	dist-mirror pkg-mirror auto-accept


USES=		tk:run

NO_BUILD=	yes

post-patch:
	@${REINPLACE_CMD} -e \
		's|/usr/X11R6|${PREFIX}|g ; \
		 s|/usr/local/bin/wish|${WISH}|' ${WRKSRC}/xshodou
	@${REINPLACE_CMD} -e \
		's|/usr/X11R6|${FAKE_DESTDIR}${TRUE_PREFIX}|g ; \
		 s|/man/man1|/share/man/man1|' ${WRKSRC}/Makefile

.include <bsd.port.mk>
