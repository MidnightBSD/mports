PORTNAME=	kcc
PORTVERSION=	1.1
PORTREVISION=	1
CATEGORIES=	japanese
MASTER_SITES=	ftp://ftp.sra.co.jp/pub/os/linux/JE/sources/base/
DISTNAME=	${PORTNAME}
DIST_SUBDIR=	${DISTNAME}-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kanji code conversion Filter

LICENSE=	gpl2
LICENSE_FILE=	${WRKSRC}/COPYING

FAKE_OPTS=	trueprefix

INSTALL_TARGET=	install install.man
PLIST_FILES=	bin/kcc share/man/ja/man1/kcc.1.gz

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/ja/man1/

.include <bsd.port.mk>
