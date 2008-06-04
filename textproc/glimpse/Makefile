# New ports collection makefile for:	glimpse
# http://webglimpse.org/
# Date created:		25 August 1996
# Whom:			chuckr@freebsd.org
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/glimpse/Makefile,v 1.29 2007/06/23 03:47:30 beech Exp $
#

PORTNAME=	glimpse
PORTVERSION=	4.13.1
CATEGORIES=	textproc databases
MASTER_SITES=	ftp://ftp.polito.it/pub/tools/unix/harvest/ \
		LOCAL/beech

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text search engine
LICENSE=	restricted

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
