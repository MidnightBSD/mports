PORTNAME=	RPC-XML
PORTVERSION=	0.80
CATEGORIES=	net www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	XML-RPC client and server library for Perl

LICENSE=	artistic2 lgpl2.1
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-XML-Parser>=2.31:${PORTSDIR}/textproc/p5-XML-Parser \
		p5-libwww>=5.834:${PORTSDIR}/www/p5-libwww
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-DateTime-Format-ISO8601>=0.07:${PORTSDIR}/devel/p5-DateTime-Format-ISO8601

USES=		gmake perl5
USE_PERL5=	configure

OPTIONS_DEFINE=	XS

XS_BUILD_DEPENDS=	p5-XML-LibXML>=1.85:${PORTSDIR}/textproc/p5-XML-LibXML
XS_RUN_DEPENDS=		${XS_BUILD_DEPENDS}

.include <bsd.port.mk>
