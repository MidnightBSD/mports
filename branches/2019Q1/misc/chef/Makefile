# $MidnightBSD$
# $FreeBSD: head/misc/chef/Makefile 386312 2015-05-14 10:15:04Z mat $

PORTNAME=	chef
PORTVERSION=	19930426
CATEGORIES=	misc
MASTER_SITES=	http://mysite.verizon.net/ebrowne72/chef/ \
		FREEBSD_LOCAL/brooks
DISTNAME=	bork

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Feelter thet cunferts Ingleesh text tu Muck Cheenese-a

LICENSE=	unknown

CONFLICTS=	filters-* talkfilters-*
PLIST_FILES=	bin/chef
USES=		tar:Z

WRKSRC=		${WRKDIR}/bork

do-build:
	(cd ${WRKSRC} && lex chef.x && ${CC} ${CFLAGS} -o chef lex.yy.c -ll)

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/chef ${STAGEDIR}${PREFIX}/bin

.include <bsd.port.mk>
