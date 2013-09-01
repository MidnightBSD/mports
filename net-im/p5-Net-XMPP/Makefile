# $MidnightBSD$

PORTNAME=	Net-XMPP
PORTVERSION=	1.02.04
CATEGORIES=	net-im perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:DAPATRICK
PKGNAMEPREFIX=	p5-
DISTNAME=	${PORTNAME}-${PORTVERSION:R}_${PORTVERSION:E}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Net::XMPP provides Perl Developer access to the XMPP protocol

LICENSE=	perl

BUILD_DEPENDS=	p5-Authen-SASL>=2.12:${PORTSDIR}/security/p5-Authen-SASL \
		p5-Digest-SHA1>=1.02:${PORTSDIR}/security/p5-Digest-SHA1 \
		p5-XML-Stream>=1.23.04:${PORTSDIR}/textproc/p5-XML-Stream
RUN_DEPENDS=	p5-Authen-SASL>=2.12:${PORTSDIR}/security/p5-Authen-SASL \
		p5-Digest-SHA1>=1.02:${PORTSDIR}/security/p5-Digest-SHA1 \
		p5-XML-Stream>=1.23.04:${PORTSDIR}/textproc/p5-XML-Stream

USE_PERL5=	yes
PERL_MODBUILD=	yes

MAN3=		Net::XMPP.3 \
		Net::XMPP::Client.3 \
		Net::XMPP::Connection.3 \
		Net::XMPP::Debug.3 \
		Net::XMPP::IQ.3 \
		Net::XMPP::JID.3 \
		Net::XMPP::Message.3 \
		Net::XMPP::Namespaces.3 \
		Net::XMPP::Presence.3 \
		Net::XMPP::PrivacyLists.3 \
		Net::XMPP::Protocol.3 \
		Net::XMPP::Roster.3 \
		Net::XMPP::Stanza.3

.include <bsd.port.mk>
