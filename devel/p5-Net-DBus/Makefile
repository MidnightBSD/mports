PORTNAME=	Net-DBus
PORTVERSION=	1.2.0
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension for the DBus message system

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-XML-Grove>=0:textproc/p5-XML-Grove \
		p5-XML-Twig>=0:textproc/p5-XML-Twig
LIB_DEPENDS=	libdbus-1.so:devel/dbus
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5 pkgconfig
USE_PERL5=	configure

.include <bsd.port.mk>
