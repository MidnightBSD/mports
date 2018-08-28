# $MidnightBSD$

PORTNAME=	docutils
PORTVERSION=	0.12
PORTREVISION=	1
CATEGORIES=	textproc python
MASTER_SITES=	SF \
		CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Python Documentation Utilities

LICENSE=	publicdom

USES=	python
USE_PYTHON=	distutils autoplist

OPTIONS_DEFINE=	PYGMENTS
PYGMENTS_DESC=	Syntax highlighting

BIN_SCRIPTS=	rst2html.py rst2s5.py rst2latex.py rst2xetex.py \
	rst2man.py rst2xml.py rst2pseudoxml.py rstpep2html.py \
	rst2odt.py rst2odt_prepstyles.py

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MPYGMENTS}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pygments>=1.6:${PORTSDIR}/textproc/py-pygments
.endif

post-install:
.for script in ${BIN_SCRIPTS}
	@cd ${PREFIX}/bin && ${LN} -sf ${script} ${script:C/\.py//}
.endfor

.include <bsd.port.mk>
