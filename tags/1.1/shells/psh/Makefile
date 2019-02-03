# $MidnightBSD$

PORTNAME=	psh
PORTVERSION=	1.8.1
PORTREVISION=	2
CATEGORIES=	shells perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:GREGOR

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	New shell made entirely out of a Perl script

LICENSE=	perl

PERL_CONFIGURE=	yes

SUB_FILES=	pkg-install pkg-deinstall

post-install:
	@${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.include <bsd.port.mk>
