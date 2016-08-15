# $MidnightBSD$
# $FreeBSD: ports/devel/p5-Net-DBus/Makefile,v 1.15 2007/09/08 00:57:37 linimon Exp $

PORTNAME=	Net-DBus
PORTVERSION=	1.0.0
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Net
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for the DBus message system

LICENSE=	perl

LIB_DEPENDS=	dbus-1.3:${PORTSDIR}/devel/dbus
RUN_DEPENDS=	${SITE_PERL}/XML/Twig.pm:${PORTSDIR}/textproc/p5-XML-Twig \
		${SITE_PERL}/XML/Grove.pm:${PORTSDIR}/textproc/p5-XML-Grove \
		${SITE_PERL}/${PERL_ARCH}/Time/HiRes.pm:${PORTSDIR}/devel/p5-Time-HiRes

USES=		pkgconfig 
PERL_CONFIGURE=	yes

MAN3=	Net::DBus::ASyncReply.3 Net::DBus::Annotation.3 Net::DBus::Tutorial.3 \
	Net::DBus::RemoteObject.3 Net::DBus::Binding::Connection.3 \
	Net::DBus::Binding::PendingCall.3 Net::DBus::RemoteService.3 \
	Net::DBus::Tutorial::ExportingObjects.3 Net::DBus::Dumper.3 \
	Net::DBus::Binding::Iterator.3 Net::DBus::Binding::Message.3 \
	Net::DBus::Binding::Message::Signal.3 Net::DBus::Binding::Bus.3 \
	Net::DBus::Binding::Server.3 Net::DBus::Binding::Watch.3 \
	Net::DBus::Service.3 Net::DBus::Tutorial::UsingObjects.3\
	Net::DBus.3 Net::DBus::Object.3 Net::DBus::Reactor.3 \
	Net::DBus::Exporter.3 Net::DBus::Binding::Value.3 \
	Net::DBus::Test::MockConnection.3 Net::DBus::Test::MockObject.3 \
	Net::DBus::Binding::Introspector.3 Net::DBus::Callback.3 \
	Net::DBus::Binding::Message::MethodReturn.3 \
	Net::DBus::Binding::Message::MethodCall.3 \
	Net::DBus::Binding::Message::Error.3 \
	Net::DBus::Error.3 Net::DBus::Test::MockIterator.3 \
	Net::DBus::Test::MockMessage.3

.include <bsd.port.mk>
