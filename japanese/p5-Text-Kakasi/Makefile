PORTNAME=	Text-Kakasi
PORTVERSION=	2.04
PORTREVISION=	3
CATEGORIES=	japanese textproc perl5
MASTER_SITES=	CPAN

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Kakasi library module for Perl5
WWW=		http://www.daionet.gr.jp/~knok/kakasi/

LICENSE=	other

LIB_DEPENDS=	libkakasi.so:japanese/kakasi

USES=		perl5
USE_PERL5=	configure

NO_TEST=	yes

.include <bsd.port.pre.mk>

PKGNAMEPREFIX:=	${PKGNAMEPREFIX}p5-

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|g' ${WRKSRC}/Makefile.PL

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Text/Kakasi/Kakasi.so

.include <bsd.port.post.mk>
