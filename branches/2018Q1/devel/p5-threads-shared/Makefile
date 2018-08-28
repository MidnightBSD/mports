# $MidnightBSD$

PORTNAME=	threads-shared
PORTVERSION=	1.57
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../../authors/id/J/JD/JDHEDDEN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for sharing data structures between threads

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-threads>=1.75:${PORTSDIR}/devel/p5-threads
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
