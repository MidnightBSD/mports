# $MidnightBSD$

PORTNAME=	scr2txt
PORTVERSION=	1.2
PORTREVISION=	1
CATEGORIES=	textproc

MASTER_SITES=	${MASTER_SITE_FREEBSD_LOCAL}
MASTER_SITE_SUBDIR= nik
NO_WRKSUBDIR=	yes

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Converts the output of "vidcontrol -p" to text

LICENSE=        gpl2

PLIST_FILES=	bin/scr2txt \
		man/man1/scr2txt.1.gz

do-install:	
	@cd ${WRKSRC}; ${MAKE} BINDIR=${PREFIX}/bin SHAREDIR=${PREFIX} install

.include <bsd.port.mk>
