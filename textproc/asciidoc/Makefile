PORTNAME=	asciidoc
PORTVERSION=	10.2.1
CATEGORIES=	textproc
MASTER_SITES=	PYPI \
		https://github.com/asciidoc-py/asciidoc-py/raw/${PORTVERSION}/doc/:manpage
DISTFILES=	asciidoc-${PORTVERSION}${EXTRACT_SUFX} \
		a2x.1.txt:manpage
EXTRACT_ONLY=	asciidoc-${PORTVERSION}${EXTRACT_SUFX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text document format for writing short documents and man pages
WWW=		https://github.com/asciidoc-py/asciidoc-py

LICENSE=	gpl2+

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	docbook-xsl>=0:textproc/docbook-xsl

USES=		gnome python:3.5+ shebangfix
USE_GNOME=	libxml2 libxslt
USE_PYTHON=	autoplist distutils noflavors

NO_ARCH=	yes

SHEBANG_FILES=	asciidoc/resources/filters/*.py \
		asciidoc/resources/filters/*/*.py

post-patch:
	@${CP} ${DISTDIR}/a2x.1.txt ${WRKSRC}/a2x.1.txt

post-build:
	@cd ${WRKSRC} && ${PYTHON_CMD} -m asciidoc.a2x -f manpage a2x.1.txt

post-install:
	${INSTALL_MAN} ${WRKSRC}/a2x.1 ${PREFIX}/share/man/man1/

.include <bsd.port.mk>
