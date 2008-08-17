# New ports collection makefile for:	p5-SMS-Send
# Date created:		2006-08-26
# Whom:			Tsung-Han Yeh <snowfly@yuntech.edu.tw>
#
# $MidnightBSD$
# $FreeBSD: ports/comms/p5-SMS-Send/Makefile,v 1.5 2008/03/12 17:30:28 leeym Exp $
#

PORTNAME=	SMS-Send
PORTVERSION=	0.05
PORTREVISION=	1
CATEGORIES=	comms perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Driver-based API for sending SMS messages
LICENSE=	perl

RUN_DEPENDS=	p5-Class-Adapter>=0:${PORTSDIR}/devel/p5-Class-Adapter \
		p5-Params-Util>=0.14:${PORTSDIR}/devel/p5-Params-Util
BUILD_DEPENDS=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		SMS::Send.3 \
		SMS::Send::AU::Test.3 \
		SMS::Send::Driver.3 \
		SMS::Send::Test.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500905
RUN_DEPENDS+=	p5-Module-Pluggable>=2.5:${PORTSDIR}/devel/p5-Module-Pluggable
.endif

.include <bsd.port.post.mk>
