# $MidnightBSD$

PORTNAME=	Sub-Exporter
PORTVERSION=	0.987
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Sophisticated exporter for custom-built routines

LICENSE=	artistic gpl
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Sub-Install>=0.92:${PORTSDIR}/devel/p5-Sub-Install \
		p5-Data-OptList>=0.100:${PORTSDIR}/devel/p5-Data-OptList \
		p5-Params-Util>=0.14:${PORTSDIR}/devel/p5-Params-Util
BUILD_DEPENDS=	${RUN_DEPENDS}

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
