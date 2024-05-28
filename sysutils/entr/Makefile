PORTNAME=	entr
PORTVERSION=	5.5
CATEGORIES=	sysutils
MASTER_SITES=	https://eradman.com/entrproject/code/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Runs arbitrary commands when files change
WWW=		https://eradman.com/entrproject

LICENSE=	iscl bsd2
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

FAKE_OPTS=	trueprefix

MAKEFILE=	Makefile.bsd
MAKE_ARGS+=	MANPREFIX=${MANPREFIX}/man
PLIST_FILES=	bin/entr man/man1/entr.1.gz

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/entr
	${MV} ${PREFIX}/man1/entr.1 ${PREFIX}/man/man1/entr.1

.include <bsd.port.mk>
