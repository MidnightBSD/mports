# Created by: Kevin Golding <ports@caomhin.org>

PORTNAME=	trml2pdf
PORTVERSION=	1.2
PORTREVISION=	6
CATEGORIES=	print python
MASTER_SITES=	SF/kraft/${PORTNAME}/${PORTVERSION}
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny RML2PDF easily creates PDF documents

LICENSE=	lgpl2.1

DEPRECATED=	Uses deprecated version of python
EXPIRATION_DATE=	2020-08-15

RUN_DEPENDS=	${PY_PILLOW} \
		${PYTHON_PKGNAMEPREFIX}reportlab>=0:print/py-reportlab@${PY_FLAVOR}

USES=		python:2.7 shebangfix tar:bzip2
USE_PYTHON=	flavors

NO_BUILD=	yes
NO_ARCH=	yes

SHEBANG_FILES=	trml2pdf/trml2pdf.py

DOCSDIR=	${PREFIX}/share/doc/py-${PORTNAME}
EXAMPLESDIR=	${PREFIX}/share/examples/py-${PORTNAME}

OPTIONS_DEFINE=	DOCS EXAMPLES

do-install:
	@${MKDIR} ${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/trml2pdf
	${INSTALL_SCRIPT} ${WRKSRC}/trml2pdf/* \
		${FAKE_DESTDIR}${PYTHON_SITELIBDIR}/trml2pdf

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README.txt ${FAKE_DESTDIR}${DOCSDIR}

post-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${CP} -R ${WRKSRC}/rmls/ ${FAKE_DESTDIR}${EXAMPLESDIR}/rmls

.include <bsd.port.mk>
