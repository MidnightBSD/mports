PORTNAME=	amqp
PORTVERSION=	1.8.0
CATEGORIES=	net rubygems
MASTER_SITES=	RG

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Implementation of the AMQP protocol for RabbitMQ clients
WWW=		http://rubyamqp.info/

LICENSE=	bsd2 ruby
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	rubygem-amq-protocol>=2.2.0:net/rubygem-amq-protocol \
		rubygem-eventmachine>=0:devel/rubygem-eventmachine

USES=		gem

NO_ARCH=	yes

.include <bsd.port.mk>
