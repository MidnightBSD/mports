# $MidnightBSD$
# $FreeBSD: ports/sysutils/p5-File-Listing/Makefile,v 1.3 2011/09/23 12:43:01 culot Exp $

PORTNAME=	File-Listing
PORTVERSION=	6.03
CATEGORIES=	sysutils perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Parse directory listings
LICENSE=	perl

RUN_DEPENDS=	p5-HTTP-Date>=6:${PORTSDIR}/www/p5-HTTP-Date
BUILD_DEPENDS:=	${RUN_DEPENDS}

CONFLICTS=	p5-libwww-5*

PERL_CONFIGURE=	yes

MAN3=		File::Listing.3

.include <bsd.port.mk>
