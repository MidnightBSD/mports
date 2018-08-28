# $MidnightBSD$

PORTNAME=	PPIx-Regexp
PORTVERSION=	0.037
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:WYANT
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PPI regular expression parser

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-List-MoreUtils>0:${PORTSDIR}/lang/p5-List-MoreUtils \
		p5-PPI>=1.117:${PORTSDIR}/textproc/p5-PPI \
		p5-Task-Weaken>0:${PORTSDIR}/devel/p5-Task-Weaken
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	5.14+

.include <bsd.port.mk>
