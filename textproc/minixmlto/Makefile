PORTNAME=	minixmlto
PORTVERSION=	0.1.0
CATEGORIES=	textproc
MASTER_SITES=	https://codeberg.org/bapt/${PORTNAME}/archive/${DISTVERSIONFULL}${EXTRACT_SUFX}?dummy=/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Minimalistic alternative to xmlto
WWW=		https://github.com/bapt/minixmlto

LICENSE=	bsd2

RUN_DEPENDS=	docbook-xsl>0:textproc/docbook-xsl \
		xsltproc:textproc/libxslt \
		html2text:textproc/html2text \
		docbook2mdoc:textproc/docbook2mdoc

WRKSRC=		${WRKDIR}/${PORTNAME}

PLIST_FILES=	bin/minixmlto
MAKE_ARGS=	DOCBOOK_XSL="${LOCALBASE}/share/xsl/docbook" PREFIX="${PREFIX}"
NO_ARCH=	yes

.include <bsd.port.mk>
