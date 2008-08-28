# New ports collection makefile for:	p5-Storable
# Date created:				July 7th 1997
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $MidnightBSD: mports/devel/p5-Storable/Makefile,v 1.1 2006/10/03 22:39:26 laffer1 Exp $
# $FreeBSD: ports/devel/p5-Storable/Makefile,v 1.43 2005/06/11 16:12:52 skv Exp $
#

PORTNAME=	Storable
PORTVERSION=	2.18
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Persistency for perl data structures
LICENSE=	perl

PERL_CONFIGURE=	yes

MAN3=		Storable.3

post-patch:
	@${PERL} -pi -e '$$_="" if /MAN3PODS|INSTALLDIRS/' ${WRKSRC}/Makefile.PL

.include <bsd.port.mk>
