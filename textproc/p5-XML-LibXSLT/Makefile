PORTNAME=	XML-LibXSLT
PORTVERSION=	2.003000
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl interface to the GNOME XSLT library
WWW=		https://metacpan.org/release/XML-LibXSLT

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
LIB_DEPENDS=	libgcrypt.so:security/libgcrypt \
		libgpg-error.so:security/libgpg-error
RUN_DEPENDS=	p5-XML-LibXML>=1.70:textproc/p5-XML-LibXML

USES=		gnome perl5 pkgconfig
USE_GNOME=	libxml2 libxslt
USE_PERL5=	configure

post-install:
	${STRIP_CMD} ${PREFIX}/${SITE_ARCH_REL}/auto/XML/LibXSLT/LibXSLT.so

.include <bsd.port.mk>
