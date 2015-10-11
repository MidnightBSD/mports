# $MidnightBSD$

PORTNAME=	Net-XMPP
DISTVERSION=	1.05
CATEGORIES=	net-im perl5
MASTER_SITES=	CPAN
#MASTER_SITE_SUBDIR=	CPAN:DAPATRICK
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Net::XMPP provides Perl Developer access to the XMPP protocol

LICENSE=	lgpl2.1

BUILD_DEPENDS=	p5-Authen-SASL>=2.12:${PORTSDIR}/security/p5-Authen-SASL \
		p5-Digest-SHA>=5.95:${PORTSDIR}/security/p5-Digest-SHA \
		p5-XML-Stream>=1.24:${PORTSDIR}/textproc/p5-XML-Stream
RUN_DEPENDS:=	${BUILD_DEPENDS}
TEST_DEPENDS=	p5-LWP-Online>=1.07:${PORTSDIR}/www/p5-LWP-Online \
		p5-YAML-Tiny>=1.41:${PORTSDIR}/textproc/p5-YAML-Tiny

USES=		perl5
USE_PERL5=	modbuild
PERL_MODBUILD=	yes

.include <bsd.port.mk>
