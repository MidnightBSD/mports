# $MidnightBSD: mports/converters/p5-Encode-Detect/Makefile,v 1.4 2008/09/15 18:13:05 crash Exp $
# $FreeBSD: ports/converters/p5-Encode-Detect/Makefile,v 1.2 2006/11/21 12:12:31 sumikawa Exp $

PORTNAME=	Encode-Detect
PORTVERSION=	1.01
PORTREVISION=	1
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Encode
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	An Encode::Encoding subclass that detects the encoding of data
LICENSE=	mpl

BUILD_DEPENDS+=	${SITE_PERL}/ExtUtils/CBuilder.pm:${PORTSDIR}/devel/p5-ExtUtils-CBuilder

PERL_MODBUILD=	yes

MAN3=		Encode::Detect.3 Encode::Detect::Detector.3

.include <bsd.port.mk>
