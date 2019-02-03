# Created by: Steve Wills <steve@mouf.net>
# $FreeBSD: head/net/p5-Net-RabbitMQ/Makefile 373448 2014-11-26 13:08:24Z mat $
# $MidnightBSD$

PORTNAME=	Net-RabbitMQ
PORTVERSION=	0.2.0
CATEGORIES=	net perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JESUS
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module to interact with RabbitMQ over AMQP using librabbitmq

LICENSE=	unknown

BUILD_DEPENDS=	${LOCALBASE}/sbin/rabbitmqctl:${PORTSDIR}/net/rabbitmq
RUN_DEPENDS=	${LOCALBASE}/sbin/rabbitmqctl:${PORTSDIR}/net/rabbitmq

USES=		perl5
USE_PERL5=	configure
PERL_CONFIGURE=	yes

.include <bsd.port.mk>
