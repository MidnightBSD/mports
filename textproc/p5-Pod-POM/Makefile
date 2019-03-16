# $MidnightBSD$
# $FreeBSD: ports/textproc/p5-Pod-POM/Makefile,v 1.3 2003/11/04 14:27:15 skv Exp $

PORTNAME=	Pod-POM
PORTVERSION=	2.01
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	POD Object Model

LICENSE=	artistic gpl
LICENSE_COMB=	dual

TEST_DEPENDS=	p5-File-Slurper>=0.004:devel/p5-File-Slurper \
		p5-Test-Differences>=0:devel/p5-Test-Differences \
		p5-Text-Diff>=0:textproc/p5-Text-Diff

NO_ARCH=	yes
USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
