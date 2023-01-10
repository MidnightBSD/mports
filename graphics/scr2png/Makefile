PORTNAME=	scr2png
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	graphics

MASTER_SITES=	FREEBSD_LOCAL/nik

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts the output of "vidcontrol -p" to PNG

LICENSE=	bsd2

LIB_DEPENDS=	libgd.so:graphics/gd

NO_WRKSUBDIR=	yes

USES=		uidfix
PLIST_FILES=	bin/scr2png man/man1/scr2png.1.gz

post-extract:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's|<gd/gd\.h>|<gd.h>|' ${WRKSRC}/scr2png.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/scr2png ${PREFIX}/bin/scr2png
	${INSTALL_MAN} ${WRKSRC}/scr2png.1 ${PREFIX}/man/man1/scr2png.1

.include <bsd.port.mk>
