PORTNAME=	Text-MeCab
PORTVERSION=	0.20009
PORTREVISION=	3
CATEGORIES=	japanese textproc perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Alternate Interface To libmecab
WWW=		https://metacpan.org/release/Text-MeCab

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

RUN_DEPENDS=	p5-Class-Accessor>0:devel/p5-Class-Accessor
LIB_DEPENDS=	libmecab.so:japanese/mecab
TEST_DEPENDS=	p5-Test-Requires>0:devel/p5-Test-Requires

MAKE_JOBS_UNSAFE=	yes

USES=		perl5
USE_PERL5=	configure
CONFIGURE_ARGS=	</dev/null

NO_TEST=	yes

# dictionary encoding (euc-jp, shift_jis, utf-8)
ENCODING?=	euc-jp

post-patch:
	@${REINPLACE_CMD} -e "/default_encoding = /s/euc-jp/${ENCODING}/" \
		${WRKSRC}/tools/probe_mecab.pl

post-configure:
	@${REINPLACE_CMD} -e "/^LD = /s/cc/cc -pthread/" \
		${WRKSRC}/Makefile

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

.include <bsd.port.post.mk>
