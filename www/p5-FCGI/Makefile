# $MidnightBSD$

PORTNAME=	FCGI
PORTVERSION=	0.74
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:FLORA
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Modules for perl5, for enabling FastCGI support in CGI scripts
LICENSE=	perl

OPTIONS=	PURE_PERL	"Build pure Perl version" off

PERL_CONFIGURE=	yes

MAN3=		FCGI.3

.include <bsd.mport.options.mk>

.if defined(WITH_PURE_PERL)
CONFIGURE_ARGS+=--pure-perl
PLIST_SUB=	PURE_PERL="@comment "
.else
PLIST_SUB=	PURE_PERL=""
.endif

.include <bsd.port.mk>
