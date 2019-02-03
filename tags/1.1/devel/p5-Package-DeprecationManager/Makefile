# $MidnightBSD$

PORTNAME=	Package-DeprecationManager
PORTVERSION=	0.13
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Manage deprecation warnings for your distribution
LICENSE=	perl

BUILD_DEPENDS=	p5-Params-Util>=0:${PORTSDIR}/devel/p5-Params-Util \
		p5-Sub-Install>=0:${PORTSDIR}/devel/p5-Sub-Install \
		p5-List-MoreUtils>=0:${PORTSDIR}/lang/p5-List-MoreUtils
RUN_DEPENDS=	p5-Params-Util>=0:${PORTSDIR}/devel/p5-Params-Util \
		p5-Sub-Install>=0:${PORTSDIR}/devel/p5-Sub-Install \
		p5-List-MoreUtils>=0:${PORTSDIR}/lang/p5-List-MoreUtils


PERL_CONFIGURE=	yes

post-extract:
	@${PERL} -i -ne "print unless /'BUILD_REQUIRES'/../},/" ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
