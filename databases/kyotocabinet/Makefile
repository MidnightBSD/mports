PORTNAME=	kyotocabinet
PORTVERSION=	1.2.80
PORTREVISION=	1
CATEGORIES=	databases
MASTER_SITES=	https://dbmx.net/kyotocabinet/pkg/ \
		FREEBSD_LOCAL/sunpoet

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Straightforward implementation of DBM
WWW=		https://dbmx.net/kyotocabinet/

LICENSE=	gpl3

USES=		compiler:c++11-lang gmake

CPPFLAGS+=	-fPIC
GNU_CONFIGURE=	yes
INSTALL_TARGET=	install-strip
MAKE_ARGS=	PCDIR=${PREFIX}/libdata/pkgconfig
TEST_TARGET=	check
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

post-install:
	${STRIP_CMD} ${PREFIX}/lib/libkyotocabinet.so

post-install-DOCS-on:
	${FIND} ${FAKE_DESTDIR}${DOCSDIR}/ -type d -exec ${CHMOD} ${BINMODE} {} +
	${FIND} ${FAKE_DESTDIR}${DOCSDIR}/ -type f -exec ${CHMOD} ${DOCMODE} {} +

.include <bsd.port.mk>
