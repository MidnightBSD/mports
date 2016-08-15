# $MidnightBSD$

PORTNAME=	Parse-RecDescent
PORTVERSION=	1.965.001
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN/../../authors/id/D/DC/DCONWAY
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:C/\.(...)$/\1/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A recursive descent parsing framework for Perl
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	YES

MAN3=		Parse::RecDescent.3

post-install:
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/tutorial
	${INSTALL_DATA} ${WRKSRC}/tutorial/* ${DOCSDIR}/tutorial
.endif

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500900
RUN_DEPENDS+=	p5-version>=0:${PORTSDIR}/devel/p5-version
.endif

.include <bsd.port.post.mk>
