# New ports collection makefile for:	devel/p5-Clone
# Date created:				05 June 2002
# Whom:					Anton Berezin <tobez@FreeBSD.org>
#
# $FreeBSD: ports/devel/p5-Clone/Makefile,v 1.9 2007/08/21 08:20:58 tobez Exp $
# $MidnightBSD: mports/devel/p5-Clone/Makefile,v 1.1 2007/09/02 02:49:24 ctriv Exp $
#

PORTNAME=	Clone
PORTVERSION=	0.29
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ctriv@MidnightBSD.org
COMMENT=	Clone - recursively copy Perl datatypes
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Clone.3

post-patch:
	${PERL} -pi -e 'm.OPTIMIZE.&&s,.,,sg' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>

