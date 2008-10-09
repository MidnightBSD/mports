# New ports collection makefile for:	ExtUtils::CBuilder
# Date created:				20 Feb 2004
# Whom:                			Mathieu Arnold <mat@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-ExtUtils-CBuilder/Makefile,v 1.1 2007/03/11 05:19:08 laffer1 Exp $
# $FreeBSD: ports/devel/p5-ExtUtils-CBuilder/Makefile,v 1.16 2006/04/11 14:51:54 mat Exp $
#

PORTNAME=	ExtUtils-CBuilder
PORTVERSION=	0.24
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Compile and link C code for Perl modules
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/File/Spec.pm:${PORTSDIR}/devel/p5-PathTools
RUN_DEPENDS=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		ExtUtils::CBuilder.3 ExtUtils::CBuilder::Platform::Windows.3

.if !defined(NOPORTDOCS)
PORTDOCS=	Changes README

post-install:
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
	@${ECHO_MSG} "===> Documentation installed in ${DOCSDIR}."
.endif

.include <bsd.port.mk>
