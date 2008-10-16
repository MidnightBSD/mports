# New ports collection makefile for:	p5-Time-Local
# Date created:	   1 july 2003
# Whom:		   Mathieu Arnold <m@absolight.net>
#
# $MidnightBSD: mports/devel/p5-Time-Local/Makefile,v 1.2 2008/01/05 05:49:17 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Time-Local/Makefile,v 1.12 2007/01/26 12:19:14 mat Exp $
#

PORTNAME=	Time-Local
PORTVERSION=	1.18
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Time
PKGNAMEPREFIX=	p5-

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
