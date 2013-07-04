# $MidnightBSD: mports/textproc/p5-Parse-Syslog/Makefile,v 1.1 2007/03/21 01:15:31 laffer1 Exp $

PORTNAME=	Parse-Syslog
PORTVERSION=	1.09
CATEGORIES=	textproc perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN}
MASTER_SITE_SUBDIR=	Parse
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 routines that present a simple interface to parse syslog files
LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/IO/Scalar.pm:${PORTSDIR}/devel/p5-IO-stringy

PERL_CONFIGURE=	yes

MAN3=		Parse::Syslog.3

.include <bsd.port.pre.mk>

# requires Time::Local 1.07_94
.if ${PERL_LEVEL} < 500800
BUILD_DEPENDS+=	${SITE_PERL}/Time/Local.pm:${PORTSDIR}/devel/p5-Time-Local
RUN_DEPENDS+=	${SITE_PERL}/Time/Local.pm:${PORTSDIR}/devel/p5-Time-Local
.endif

.if ${PERL_LEVEL} < 500600
post-configure:
	${PERL} -pi -e 's/-I\S+PERL\S+ //g if m{PERL_DL_NONLAZY}' ${WRKSRC}/Makefile
.endif

.include <bsd.port.post.mk>
