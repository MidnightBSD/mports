# $MidnightBSD$

PORTNAME=	Cache
PORTVERSION=	2.10
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl Cache interface

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-File-NFSLock>=1.2:${PORTSDIR}/devel/p5-File-NFSLock \
		p5-Heap>=0.01:${PORTSDIR}/devel/p5-Heap \
		p5-IO-String>=1.02:${PORTSDIR}/devel/p5-IO-String \
		p5-TimeDate>=2.24:${PORTSDIR}/devel/p5-TimeDate

USE_PERL5=	yes
PERL_MODBUILD=	yes

.include <bsd.port.mk>
