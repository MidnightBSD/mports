# $MidnightBSD: mports/devel/p5-DateTime-Format-Mail/Makefile,v 1.1 2009/03/21 15:42:13 laffer1 Exp $

PORTNAME=	DateTime-Format-Mail
PORTVERSION=	0.30.01
DISTVERSION=	${PORTVERSION:C/\.(..)$/\1/}
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Convert between DateTime and RFC2822/822 formats
LICENSE=	perl

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/Params/Validate.pm:${PORTSDIR}/devel/p5-Params-Validate \
		${SITE_PERL}/DateTime.pm:${PORTSDIR}/devel/p5-DateTime

PERL_MODBUILD=	yes

MAN3=		DateTime::Format::Mail.3

.include <bsd.port.mk>
