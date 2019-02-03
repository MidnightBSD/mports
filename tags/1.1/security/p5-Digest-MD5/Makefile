# $MidnightBSD$

PORTNAME=	Digest-MD5
PORTVERSION=	2.54
CATEGORIES=	security perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl5 interface to the MD5 algorithm

LICENSE=	perl

BUILD_DEPENDS=	${SITE_PERL}/Digest.pm:${PORTSDIR}/security/p5-Digest
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5
PERL_CONFIGURE=	yes

.include <bsd.port.pre.mk>

post-patch:
	${PERL} -pi -e 's/^our\s+([\$$\@\%]\w+)/use vars qw($$1); $$1/;' ${WRKSRC}/MD5.pm
	${PERL} -pi -e '$$_ = "" if m{5.006}' ${WRKSRC}/Makefile.PL

.include <bsd.port.post.mk>
