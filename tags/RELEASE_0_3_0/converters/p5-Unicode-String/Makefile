# New ports collection makefile for:	p5-Unicode-String
# Date created:				10th September 2000
# Whom:					Ilia Chipitsine <ilia@jane.cgu.chel.su>
#
# $MidnightBSD: mports/converters/p5-Unicode-String/Makefile,v 1.1 2007/05/02 23:28:56 laffer1 Exp $
# $FreeBSD: ports/converters/p5-Unicode-String/Makefile,v 1.10 2005/11/15 08:33:28 tobez Exp $
#

PORTNAME=	Unicode-String
PORTVERSION=	2.09
CATEGORIES=	converters perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Unicode
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	These are experimental Perl5 modules to handle various Unicode issues
LICENSE=	perl

PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

.if ${PERL_LEVEL} < 500804
BUILD_DEPENDS=	${SITE_PERL}/${PERL_ARCH}/MIME/Base64.pm:${PORTSDIR}/converters/p5-MIME-Base64
.endif

MAN3=		Unicode::CharName.3 Unicode::String.3

.include <bsd.port.post.mk>
