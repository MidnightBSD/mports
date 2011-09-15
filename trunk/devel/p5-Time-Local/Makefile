# New ports collection makefile for:	p5-Time-Local
#
# $MidnightBSD: mports/devel/p5-Time-Local/Makefile,v 1.3 2008/10/16 21:46:39 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Time-Local/Makefile,v 1.12 2007/01/26 12:19:14 mat Exp $
#

PORTNAME=	Time-Local
PORTVERSION=	1.20.00
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=     ${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Efficiently compute time from local and GMT time
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Time::Local.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
