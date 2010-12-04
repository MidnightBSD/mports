# $MidnightBSD$

PORTNAME=	PPIx-Utilities
PORTVERSION=	1.000001
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	../by-authors/id/E/EL/ELLIOTJS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Extensions to PPI
LICENSE=	perl

RUN_DEPENDS=	p5-Exception-Class>=1.23:${PORTSDIR}/devel/p5-Exception-Class \
		p5-PPI>=1.208:${PORTSDIR}/textproc/p5-PPI \
		p5-Readonly>=1.03:${PORTSDIR}/devel/p5-Readonly \
		p5-Task-Weaken>=0:${PORTSDIR}/devel/p5-Task-Weaken
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_MODBUILD=	yes

MAN3=		PPIx::Utilities.3 PPIx::Utilities::Exception::Bug.3 \
		PPIx::Utilities::Node.3 PPIx::Utilities::Statement.3

.include <bsd.port.mk>
