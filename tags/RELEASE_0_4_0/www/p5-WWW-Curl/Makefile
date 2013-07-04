# $MidnightBSD$
# $FreeBSD: ports/www/p5-WWW-Curl/Makefile,v 1.16 2010/09/11 20:48:43 roam Exp $

PORTNAME=	WWW-Curl
PORTVERSION=	4.13
CATEGORIES=	www ftp perl5
MASTER_SITES=	CPAN \
		http://curl.haxx.se/libcurl/perl/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl binding interface for curl
LICENSE=	mit

LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl:install

PERL_CONFIGURE=	yes

MAN3=		WWW::Curl.3

post-patch:
		${FIND} ${WRKSRC} -type f -name \*.orig -delete

.include <bsd.port.mk>
