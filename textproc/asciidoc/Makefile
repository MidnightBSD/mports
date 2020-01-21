PORTNAME=	asciidoc
PORTVERSION=	8.6.10
CATEGORIES=	textproc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Text document format for writing short documents and man pages

LICENSE=	gpl2 mit
LICENSE_COMB=	multi

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	docbook-xsl>=0:textproc/docbook-xsl

USES=		autoreconf gmake gnome python:2.7 shebangfix
USE_GNOME=	libxml2 libxslt

GNU_CONFIGURE=	yes
NO_ARCH=	yes

USE_GITHUB=	yes

SHEBANG_GLOB=	*.py
SHEBANG_LANG=	python2
python2_CMD=	${PYTHON_CMD}

post-patch:
	@${REINPLACE_CMD} -e '/^INSTALL_PROG/ s|INSTALL_PROGRAM|INSTALL_SCRIPT|; s|\.conf|&.sample|; s|python\( a2x.py\)|${PYTHON_CMD}\1|' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|/usr/local|${LOCALBASE}|' ${WRKSRC}/a2x.py
	@${FIND} ${WRKSRC} -name '*.conf' | ${XARGS} -I % ${LN} % %.sample

post-install:
	${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/
	${INSTALL_DATA} ${WRKSRC}/asciidocapi.py ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/

.include <bsd.port.mk>
