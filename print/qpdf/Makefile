PORTNAME=	qpdf
DISTVERSION=	10.0.1
CATEGORIES=	print
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Command-line tools for transforming and inspecting PDF documents

LICENSE=	artistic2 apache2
LICENSE_COMB=	dual
LICENSE_FILE_artistic2=	${WRKSRC}/Artistic-2.0
LICENSE_FILE_apache2=	${WRKSRC}/LICENSE.txt

USES=		compiler:c++11-lang gmake jpeg libtool localbase
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--disable-static
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	DOCS

.include <bsd.port.mk>
