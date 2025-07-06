PORTNAME=	ack
PORTVERSION=	1.39
PORTREVISION=	2
CATEGORIES=	japanese converters
MASTER_SITES=	http://ftp.vector.co.jp/06/43/1369/
DISTNAME=	${PORTNAME}${PORTVERSION:S/.//}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kanji code converter
WWW=		https://hp.vector.co.jp/authors/VA004474/etc/etc.html

LICENSE=	other

FAKE_OPTS=	trueprefix

USES=		tar:tgz

CONFLICTS_INSTALL=	p5-ack # /bin/ack

ALL_TARGET=	ack
CFLAGS+=	-Wno-error=return-type

PLIST_FILES=	bin/ack share/man/ja/man1/ack.1.gz

post-patch:
	@${REINPLACE_CMD} -E 's,(BINARY|MANUAL)),DESTDIR)$$(&, ; \
		s|^MANUAL.*|MANUAL=${PREFIX}/share/man/ja/man1|' \
		${WRKSRC}/Makefile

pre-fake:
	${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/man/ja/man1

.include <bsd.port.mk>
