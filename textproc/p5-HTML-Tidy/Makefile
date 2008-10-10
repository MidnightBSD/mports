# New ports collection makefile for:	p5-HTML-Tidy
# Date Created:				8 june 2004
# Whom:					mat
#
# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-HTML-Tidy/Makefile,v 1.7 2007/10/04 18:57:40 tobez Exp $
#

PORTNAME=	HTML-Tidy
PORTVERSION=	1.08
CATEGORIES=	textproc www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-


MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web validation in a Perl object using tidy
LICENSE=	gpl2

BUILD_DEPENDS=	${SITE_PERL}/LWP/UserAgent.pm:${PORTSDIR}/www/p5-libwww
LIB_DEPENDS=	tidy:${PORTSDIR}/www/tidy-lib
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	5.8.0+

MAN3=		HTML::Tidy.3 HTML::Tidy::Message.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
