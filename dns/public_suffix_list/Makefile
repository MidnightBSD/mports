PORTNAME=	public_suffix_list
PORTVERSION=	20230728
CATEGORIES=	dns

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Public Suffix List by Mozilla
WWW=		https://publicsuffix.org/ \
		https://github.com/publicsuffix/list

LICENSE=	MPL20
LICENSE_FILE=	${WRKSRC}/LICENSE

SLAVEDIRS=	dns/p5-Mozilla-PublicSuffix dns/py-publicsuffix dns/py-publicsuffix2 dns/py-publicsuffixlist dns/rubygem-public_suffix dns/rubygem-public_suffix_service www/py-adblock

NO_ARCH=	yes
NO_BUILD=	yes

PORTDATA=	public_suffix_list.dat \
		test_psl.txt

GH_ACCOUNT=	publicsuffix
GH_PROJECT=	list
GH_TAGNAME=	4e6c53c
USE_GITHUB=	yes

do-install:
	${MKDIR} ${STAGEDIR}${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/public_suffix_list.dat ${WRKSRC}/tests/test_psl.txt ${STAGEDIR}${DATADIR}/

.include <bsd.port.mk>
