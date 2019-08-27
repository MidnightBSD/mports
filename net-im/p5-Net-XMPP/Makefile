# Created by: Lars Eggert <lars.eggert@gmx.net>

PORTNAME=	Net-XMPP
PORTVERSION=	1.05
PORTREVISION=	1
CATEGORIES=	net-im perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Net::XMPP provides Perl Developer access to the XMPP protocol

LICENSE=	lgpl2.1
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Authen-SASL>=2.12:security/p5-Authen-SASL \
		p5-XML-Stream>=1.24:textproc/p5-XML-Stream

NO_ARCH=	yes
NO_TEST=	yes
USES=		perl5
USE_PERL5=	modbuild

.include <bsd.port.mk>
