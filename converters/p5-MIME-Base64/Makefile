# New ports collection makefile for:    p5-MIME-Base64
# Date created:                         June 21th 1997
# Whom:                                 ache@freebsd.org
#
# $FreeBSD: ports/converters/p5-MIME-Base64/Makefile,v 1.41 2005/12/21 12:48:13 leeym Exp $
# $MidnightBSD$
#

PORTNAME=	MIME-Base64
PORTVERSION=	3.07
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	MIME
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 module for Base64 and Quoted-Printable encodings

PERL_CONFIGURE=	YES

MAN3=		MIME::Base64.3 \
		MIME::QuotedPrint.3

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500600
BUILD_DEPENDS+=	${SITE_PERL}/XSLoader.pm:${PORTSDIR}/devel/p5-XSLoader
RUN_DEPENDS+=	${SITE_PERL}/XSLoader.pm:${PORTSDIR}/devel/p5-XSLoader

post-patch:
	${REINPLACE_CMD} -e '/require 5.006/d' ${WRKSRC}/${CONFIGURE_SCRIPT}
.endif

.include <bsd.port.post.mk>
