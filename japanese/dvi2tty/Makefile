PORTNAME=	dvi2tty
PORTVERSION=	5.0
PORTREVISION=	3
CATEGORIES=	japanese print
MASTER_SITES=	FREEBSD_LOCAL/hrs
PKGNAMESUFFIX=	-ascii
DISTNAME=	dvi2tty${PORTVERSION}

PATCH_SITES=	${MASTER_SITES}
PATCH_DIST_STRIP=	-p1
PATCHFILES=	dvi2tty-ascii-jtex-patch dvi2tty.c-patch

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Character-based DVI file previewer

RUN_DEPENDS=	jless:japanese/less

PLIST_FILES=	bin/jdvi2tty \
		bin/jdisdvi \
		share/man/man1/jdvi2tty.1.gz

post-patch:
	${REINPLACE_CMD} -e "s/getline/get_line/g" ${WRKSRC}/dvistuff.c

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/jdvi2tty ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/disdvi ${STAGEDIR}${PREFIX}/bin/jdisdvi
	${INSTALL_MAN} ${WRKSRC}/dvi2tty.1 ${STAGEDIR}${PREFIX}/share/man/man1/jdvi2tty.1

.include <bsd.port.mk>
