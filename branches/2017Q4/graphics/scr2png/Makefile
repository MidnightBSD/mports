# $MidnightBSD$

PORTNAME=	scr2png
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	graphics

MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR= nik
NO_WRKSUBDIR=	yes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts the output of "vidcontrol -p" to PNG

LICENSE=	bsd2

LIB_DEPENDS=	gd:${PORTSDIR}/graphics/gd

USES=		uidfix
PLIST_FILES=	bin/scr2png man/man1/scr2png.1.gz

post-extract:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/Makefile
	@${REINPLACE_CMD} -e 's|<gd/gd\.h>|<gd.h>|' ${WRKSRC}/scr2png.c

do-install:
	@cd ${WRKSRC}; ${MAKE} BINDIR=${PREFIX}/bin SHAREDIR=${PREFIX} install

.include <bsd.port.mk>
