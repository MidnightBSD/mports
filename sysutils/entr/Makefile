PORTNAME=	entr
PORTVERSION=	5.6
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
MAKE_ARGS+=	MANPREFIX=${PREFIX}/share/man
PLIST_FILES=	bin/entr share/man/man1/entr.1.gz

NO_TEST=	yes

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/entr

.include <bsd.port.mk>
