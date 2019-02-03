# $MidnightBSD$
# $FreeBSD: ports/converters/p5-Encode-Detect/Makefile,v 1.2 2006/11/21 12:12:31 sumikawa Exp $

PORTNAME=	Encode-Detect
PORTVERSION=	1.01
PORTREVISION=	3
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Encode::Encoding subclass that detects the encoding of data

LICENSE=	mpl

BUILD_DEPENDS+=	${SITE_PERL}/ExtUtils/CBuilder.pm:${PORTSDIR}/devel/p5-ExtUtils-CBuilder

USES=	perl5
PERL_MODBUILD=	yes

.include <bsd.port.mk>
