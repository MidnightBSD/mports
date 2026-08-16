PORTNAME=	Image-ExifTool
DISTVERSION=	13.36
PORTREVISION=	1
CATEGORIES=	graphics perl5
MASTER_SITES=	https://exiftool.org/ \
		CPAN
MASTER_SITE_SUBDIR=	CPAN:EXIFTOOL
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl module for getting EXIF data from image files
WWW=		https://exiftool.org

LICENSE=	artistic gpl+
LICENSE_COMB=	dual

USES=		perl5
USE_PERL5=	configure

CONFLICTS_INSTALL=	p5-Image-ExifTool-devel

NO_ARCH=	yes

PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/Changes ${WRKSRC}/README ${FAKE_DESTDIR}${DOCSDIR}
	cd ${WRKSRC}/ && ${COPYTREE_SHARE} html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
