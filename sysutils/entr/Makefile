PORTNAME=	entr
PORTVERSION=	5.0
CATEGORIES=	sysutils
MASTER_SITES=	http://entrproject.org/code/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Runs arbitrary commands when files change

LICENSE=	iscl bsd2
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

MAKEFILE=	Makefile.bsd
MAKE_ARGS+=	MANPREFIX=${MANPREFIX}/man
TEST_TARGET=	test
PLIST_FILES=	bin/entr man/man1/entr.1.gz

post-install:
	@${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/entr
	${MV} ${PREFIX}/man1/entr.1 ${PREFIX}/man/man1/entr.1

.include <bsd.port.mk>
