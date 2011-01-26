# $MidnightBSD: mports/textproc/glimpse/Makefile,v 1.2 2009/11/08 21:39:46 laffer1 Exp $

PORTNAME=	glimpse
PORTVERSION=	4.13.1
CATEGORIES=	textproc databases
MASTER_SITES=	ftp://ftp.polito.it/pub/tools/unix/harvest/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text search engine
LICENSE=	restricted

MAKE_JOBS_UNSAFE=	yes
PORTDOCS=	README COPYRIGHT

FAKE_OPTS+=	prefixhack

NO_CDROM=	Restrictive copyright (don't sell for profit)
GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CFLAGS="${CFLAGS} -DISO_CHAR_SET=1 -D__STRICT_ANSI__"
MAN1=		glimpse.1 glimpseindex.1 glimpseserver.1 agrep.1

pre-configure:
	@${CHMOD} a+x ${WRKSRC}/configure

post-install:
.if !defined(NOPORTDOCS)
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}/
.endif
	${INSTALL_PROGRAM} ${WRKSRC}/index/wgconvert ${PREFIX}/bin

.include <bsd.port.mk>
