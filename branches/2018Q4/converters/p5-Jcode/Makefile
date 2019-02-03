# $MidnightBSD$
# $FreeBSD: ports/japanese/p5-Jcode/Makefile,v 1.35 2008/09/03 11:06:07 kuriyama Exp $

PORTNAME=	Jcode
PORTVERSION=	2.07
CATEGORIES=	converters japanese perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl extension interface to convert Japanese text
LICENSE=	perl

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.if ${PERL_LEVEL} < 500801
BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64
RUN_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64

PLIST_SUB+=	WRAPPER="@comment " REALMOD=""
.else
PLIST_SUB+=	WRAPPER="" REALMOD="@comment "
.endif

.include <bsd.port.post.mk>
