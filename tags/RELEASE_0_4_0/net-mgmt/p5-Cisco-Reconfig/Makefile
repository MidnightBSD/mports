# $MidnightBSD: mports/net-mgmt/p5-Cisco-Reconfig/Makefile,v 1.2 2007/06/06 19:04:40 ctriv Exp $ 

PORTNAME=	Cisco-Reconfig
PORTVERSION=	0.91
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse and generate Cisco configuration files
LICENSE=	perl

RUN_DEPENDS=	${SITE_PERL}/IO/String.pm:${PORTSDIR}/devel/p5-IO-String
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Cisco::Reconfig.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500703
RUN_DEPENDS+=	${SITE_PERL}/${PERL_ARCH}/Scalar/Util.pm:${PORTSDIR}/lang/p5-Scalar-List-Utils
.endif

.include <bsd.port.post.mk>
