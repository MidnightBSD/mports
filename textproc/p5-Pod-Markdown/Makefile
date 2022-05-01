# Created by: Cheng-Lung Sung <clsung@FreeBSD.org>

PORTNAME=	Pod-Markdown
PORTVERSION=	3.300
PORTREVISION=	1
CATEGORIES=	textproc devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Module to convert POD to Markdown

LICENSE=	artistic gpl
LICENSE_COMB=	dual
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-URI>=0:net/p5-URI

USES=		perl5
USE_PERL5=	configure

NO_ARCH=	yes
NO_TEST=	yes

.include <bsd.port.mk>
