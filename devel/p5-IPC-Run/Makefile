PORTNAME=	IPC-Run
PORTVERSION=	20231003.0
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=CPAN:TODDR
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Run subprocesses with piping and redirection
WWW=		https://metacpan.org/release/IPC-Run

LICENSE=	artistic gpl+
LICENSE_COMB=	dual
LICENSE_FILE_ART10=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-IO-Tty>=1.08:devel/p5-IO-Tty

NO_ARCH=	yes
NO_TEST=	yes
# magus test issues.

USES=		perl5
USE_PERL5=	configure

.include <bsd.port.mk>
