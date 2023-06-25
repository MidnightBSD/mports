PORTNAME=	Spreadsheet-ParseExcel
PORTVERSION=	0.65
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Get information from Excel file
WWW=		https://metacpan.org/release/Spreadsheet-ParseExcel

LICENSE=	artistic gpl
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-OLE-Storage_Lite>=0.19:devel/p5-OLE-Storage_Lite \
		p5-Crypt-RC4>=0:security/p5-Crypt-RC4 \
		p5-Digest-Perl-MD5>=0:security/p5-Digest-Perl-MD5
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		perl5 shebangfix
SHEBANG_FILES=	sample/parse.pl \
		sample/xls2csv.pl
USE_PERL5=	configure
NO_ARCH=	yes

OPTIONS_DEFINE=	EXAMPLES

PORTEXAMPLES=	*

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}/Excel
	${INSTALL_DATA} ${WRKSRC}/sample/README ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/sample/*.pl ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/sample/Excel/* ${FAKE_DESTDIR}${EXAMPLESDIR}/Excel

.include <bsd.port.mk>
