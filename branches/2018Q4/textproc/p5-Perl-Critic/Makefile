# $MidnightBSD$

PORTNAME=	Perl-Critic
PORTVERSION=	1.10.8
CATEGORIES=	textproc devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Critique Perl source for style and standards
LICENSE=	perl

RUN_DEPENDS=	p5-B-Keywords>=1.05:${PORTSDIR}/devel/p5-B-Keywords \
		p5-Config-Tiny>=2:${PORTSDIR}/devel/p5-Config-Tiny \
		p5-Email-Address>=1.88.9:${PORTSDIR}/mail/p5-Email-Address \
		p5-Exception-Class>=1.23:${PORTSDIR}/devel/p5-Exception-Class \
		p5-File-Which>=0:${PORTSDIR}/sysutils/p5-File-Which \
		p5-IO-String>=0:${PORTSDIR}/devel/p5-IO-String \
		p5-List-MoreUtils>=0.19:${PORTSDIR}/lang/p5-List-MoreUtils \
		p5-PPI>=1.208:${PORTSDIR}/textproc/p5-PPI \
		p5-PPIx-Regexp>=0.008:${PORTSDIR}/textproc/p5-PPIx-Regexp \
		p5-Readonly>=1.03:${PORTSDIR}/devel/p5-Readonly \
		p5-String-Format>=1.13:${PORTSDIR}/textproc/p5-String-Format \
		p5-Task-Weaken>=0:${PORTSDIR}/devel/p5-Task-Weaken \
		p5-version>=0:${PORTSDIR}/devel/p5-version \
		p5-PPIx-Utilities>=1.000:${PORTSDIR}/textproc/p5-PPIx-Utilities \
		perltidy:${PORTSDIR}/devel/perltidy
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_MODBUILD=	yes

.include <bsd.port.mk>
